# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases docker extract git lol sudo web-search)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64/

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Some alias entries
alias ls='ls -F'
alias ll='ls -FlahS'
alias lsd='ls -l | grep "^d"'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color'
#alias e='emacs -nw'
#alias e='emacsclient'
#alias ec='emacsclient -a "" -c'
#alias emacs='emacsclient -a "" -t'
alias irb='irb --readline -r irb/completion'

#export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient
export CLICOLOR=1
#export GROOVY_HOME=/usr/local/opt/groovy/libexec

## Added for git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gk='git --all&'
alias gx='git --all'
alias glog="git log --oneline --graph --decorate --all"

# aliases for markdown commands
mdview() {
  pandoc "$1" -o /tmp/preview.html --standalone --metadata charset=utf-8 && open /tmp/preview.html
}
    
alias vi='nvim'
alias vim='nvim'

# Other handy command line aliases
# search and replace in a file. Use vsed old_text new_text **/*.py for all py files
vsed() {
    search=$1
    replace=$2
    shift
    shift
    vim -c "bufdo! set eventignore-=Syntax| %s/$search/$replace/gce" $*
}

# cleanup pyc/pyo/__pycache__
alias pyclean='find . \
    \( -type f -name "*.py[co]" -o -type d -name "__pycache__" \) -delete &&
    echo "Removed pycs and __pycache__"'

# ps aux with grep, but remove grep from results
alias pg='ps aux | grep -v grep | grep $1'

# Use Firefox to preview grip files
grip-dark() {
    grip $1 &
    sleep 1
    open -a Firefox "http://localhost:6419"
    wait
}

# To attempt to load a Python module and make sure it's installed
try_module() {
    python -c "
exec('''
try:
    import ${1} as _
except Exception as e:
    print(e)
''')"
}

# Find and switch to module directory
find_module_dir() {
  module=$(sed 's/-/_/g' <<< $1)
  MODULE_DIRECTORY=`python -c "
exec('''
try:
    import os.path as _, ${module}
    print(_.dirname(_.realpath(${module}.__file__)))
except Exception as e:
    print(e)
''')"`
  if  [[ -d $MODULE_DIRECTORY ]]; then
    cd $MODULE_DIRECTORY
  else
    echo "Module ${1} not found or is not importable: $MODULE_DIRECTORY"
  fi
}

# Convert a csv to json
csv2json() {
    python -c "
exec('''
import csv,json
print(json.dumps(list(csv.reader(open(\'${1}\')))))
''')"
}

## Also, zshrc sets keybindings based on $EDITOR, but since we use EMACS
## in EVIL mode, it won't understand.  Get them vim keybindings here:
bindkey -v

export GOPATH=$HOME/go

# Remove the safety aliases introduced by common-aliases
unalias rm
unalias cp
unalias mv

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

