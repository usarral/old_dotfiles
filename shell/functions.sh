function cdd() {
	cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
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

function load_dotenv(){
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