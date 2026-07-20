# Run:
# brew bundle --file=~/dotfiles/Brewfile --verbose 2>&1 | tee ~/brew-install.log
#
# After brew bundle finishes, your manual checklist:
# 
# Remap Caps Lock to Escape in:
#   System Settings->Keyboard->Keyboard Shortcuts->Modifier Keys
# SDKMAN — curl installer, then sdk install java for 25, 11, and 8
# NVM — add init lines to .zshrc (brew info nvm shows them)
# fzf — run $(brew --prefix)/opt/fzf/install for shell keybindings
# JetBrains Toolbox — open it and install IDEA, RustRover, DataGrip
# Paprika — Mac App Store, manual install
# rustup — run rustup-init after brew installs it

# Taps
tap "homebrew/bundle"
tap "nikitabobko/tap"              # Aerospace
tap "borkdude/brew"                # Babashka

# Core CLI / shell
brew "stow"
brew "tmux"
brew "tree"
brew "bat"
brew "ripgrep"
brew "fd"
brew "fzf"
brew "jq"
brew "gh"
brew "git"
brew "htop"
brew "wget"
brew "vim"
brew "terminal-notifier"
brew "entr"

# Markdown / docs
brew "grip"
brew "glow"
brew "pandoc"
brew "basictex"                    # pandoc PDF rendering backend

# Languages & runtimes
brew "elixir"
brew "go"
brew "nvm"
brew "rustup"
brew "pipx"
brew "pyenv"
brew "lua"
brew "kotlin"
brew "ktlint"
brew "clojure/tools/clojure"
brew "leiningen"
brew "cljfmt"
brew "borkdude/brew/babashka"

# Python tooling
brew "isort"
brew "black"

# Data & databases
brew "sqlite"

# Build / dev tools
brew "tree-sitter-cli"
brew "exercism"
brew "hugo"

# GUI apps (casks)
cask "iterm2"
cask "obsidian"
cask "aerospace"
cask "jetbrains-toolbox"
cask "claude"
cask "claude-code"
cask "iterm2"
cask "slack"
cask "discord"
cask "firefox"
cask "meld"
cask "jdownloader"
cask "jupyterlab-app"
cask "font-fira-code-nerd-font"
cask "font-jetbrains-mono-nerd-font"
cask "1password"
cask "dropbox"
cask "fantastical"
cask "popclip"
cask "maccy"
cask "libreoffice"
cask "docker"
cask "borders"

# Mac App Store (manual — must be signed into App Store first)
# brew "mas"
# mas "Paprika Recipe Manager 3", id: 1303222628
