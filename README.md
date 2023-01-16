<h1 align="center">
  .dotfiles created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h1>

## 🌴 Dotfile structure
```
├── 📁 bin                 # External binaries/symlinks. This folder has preference in your $PATH
├── 📁 doc                 # Documentation of your dotfiles
├── 📁 editors             # Settings of your editors (vscode, IDEA, …)
├── 📁 git                 # git config
├── 📁 langs               # Config for programming languages/libraries
├── 📁 os                  # Specific config of your Operative System or apps
├── 📁 restoration_scripts # This will be execute when you restore your dotfiles in another computer/installation
├── 📁 scripts             # Your custom scripts
├── 📁 shell               # Bash/Zsh/Fish?… configuration files
└── 📁 symlinks            # The config of your symlinks
```

## Restore your Dotfiles manually

* Install git
* Clone your dotfiles repository `git clone [your repository of dotfiles] $HOME/.dotfiles`
* Go to your dotfiles folder `cd $HOME/.dotfiles`
* Install git submodules `git submodule update --init --recursive modules/dotly`
* Install your dotfiles `DOTFILES_PATH="$HOME/.dotfiles" DOTLY_PATH="$DOTFILES_PATH/modules/dotly" "$DOTLY_PATH/bin/dot" self install`
* Restart your terminal
* Import your packages `dot package import`

## Restore your Dotfiles with script

Using wget
```bash
bash <(wget -qO- https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/restorer)
```

Using curl
```bash
bash <(curl -s https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/restorer)
```

You need to know your GitHub username, repository and install ssh key if your repository is private.

It also supports other git repos, but you need to know your git repository url.
