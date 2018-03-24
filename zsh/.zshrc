export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pure"

plugins=(git z zsh-autosuggestions)

# User config
export DEFAULT_USER=`whoami`

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Dotfiles
export DOTFILES=$HOME/.dotfiles

# Editor
export EDITOR=vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
