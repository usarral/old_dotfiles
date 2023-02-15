#Folder navigation
alias ..="cd .."
alias ...="cd ../.."
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpull="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias gcl="git clone"
alias ghc="github_clone"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias up='dot package update_all'
alias off="shutdown now"

# Docker
alias dk='docker'
alias dc='dot docker connect'
alias dp='docker ps -a'
alias ds='docker stop'
alias drma='docker rm $(dp -q)'

# Docker Compose
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dr='docker compose restart'
alias dlg='docker compose logs -f'

# PNPM
alias pn='pnpm'
alias pni='pnpm install'
alias pnu='pnpm update'
alias pnr='pnpm run'
alias npx='pnpm dlx'
