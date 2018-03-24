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

# Editor
export EDITOR=vim

# Aliases
source $HOME/.aliases.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
