function cdd() {
    cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function sd() {
    exclude_dirs=(tmp logs cache .git .svn .hg .idea .vscode .vs .vscode-server .vscode-server-insiders .zim .zshrc.pre-oh-my-zsh .zshrc.pre)
    cd "$(find . -type d | grep -v -E "(${exclude_dirs[*]})" | fzf)" || echo "Invalid directory"
}

function j() {
    fname=$(declare -f -F _z)

    [ -n "$fname" ] || source "$DOTLY_PATH/modules/z/z.sh"

    _z "$1"
}

function recent_dirs() {
    # This script depends on pushd. It works better with autopush enabled in ZSH
    escaped_home=$(echo $HOME | sed 's/\//\\\//g')
    selected=$(dirs -p | sort -u | fzf)

    cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

function get_username_repo_name() {
    url=$1
    if [[ $url == *"git@"* ]]; then
        username=$(echo $url | awk -F: '{print $2}' | awk -F/ '{print $1}')
        repo_name=$(echo $url | awk -F: '{print $2}' | awk -F/ '{print $2}' | sed 's/\.git//')
    else
        username=$(echo $url | awk -F/ '{print $4}')
        repo_name=$(echo $url | awk -F/ '{print $5}' | awk -F. '{print $1}')
    fi
    echo "$username $repo_name"
}
function github_clone() {
    url=$1
    repo_path=${2:-~/Dev/Gits}

    # Check if the repo url is a github url
    if [[ $url == *"github"* ]]; then
        username_repo_name=$(get_username_repo_name $url)
        read username repo_name <<<$username_repo_name

        if [ ! -d $repo_path/$username ]; then
            mkdir $repo_path/$username
        fi
        cd $repo_path/$username
        if [ ! -d $repo_name ]; then
            git clone $url
        else
            cd $repo_name
            # Check if the repo is a git repo
            if [ ! -d .git ]; then
                echo "The repo is not a git repo"
                exit 1
            fi
            # Check the remote url
            remote_url=$(git remote get-url origin)
            # Check if the remote url is the same as the url on format http
            if [[ $remote_url == *"github"* ]]; then
                remote_username_repo_name=$(get_username_repo_name $remote_url)
                read remote_username remote_repo_name <<<$remote_username_repo_name

                if [[ $remote_username != $username ]] || [[ $remote_repo_name != $repo_name ]]; then
                    echo "The remote url is not the same as the url"
                    exit 1
                else
                    echo "The remote url is the same as the url"
                    git pull
                fi
            else
                echo "The remote url is not a github url"
                exit 1
            fi
        fi
    else
        echo "The repo url is not a github url"
        exit 1
    fi
}

function load_dotenv() {
    # Load the .env file on ~/.dotfiles/.env on the current shell
    # Usage: load_dotenv
    # Example: load_dotenv

    # Check if the .env file exists
    if [ -f "$DOTFILES_PATH/.env" ]; then
        # Load the .env file
        for line in $(cat "$DOTFILES_PATH/.env"); do
            export $line
        done
    else
        echo "The .env file doesn't exists"
    fi
}
