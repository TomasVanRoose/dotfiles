export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="refined"

plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User config
export DEFAULT_USER=`whoami`

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Dotfiles
export DOTFILES=$HOME/.dotfiles

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Editor
export EDITOR=nvim

# Aliases
source $HOME/.aliases.sh

# Pyenv
if command -v pyenv 1>/dev/null 2>&1
then 
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null
then 
    eval "$(pyenv virtualenv-init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PYTHON_CONFIGURE_OPTS="--enable-framework" # Make matplotlib work

# Ruby environment
eval "$(rbenv init -)"

# Fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Splashscreen
clear
greeter $(tput cols)
