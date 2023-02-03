# Enable aliases to be sudo’ed
alias sudo='sudo '
#Folder navigation
alias ..="cd .."
alias ...="cd ../.."
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'
alias sd="cd ~ && cd \$(find * -type d | fzf)"


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
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias gcl="git clone"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'

# Docker
alias dk='docker'
alias dc='dot docker connect'
alias dp='docker ps -a'
alias ds='docker stop'

# Docker Compose
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dr='docker compose restart'
alias dlg='docker compose logs -f'

# PNPM
alias pn='pnpm'
alias npm='pnpm'
alias npmi='pnpm install'
alias pni='pnpm install'
alias npmu='pnpm update'
alias pnu='pnpm update'
alias npmr='pnpm run'
alias pnr='pnpm run'

