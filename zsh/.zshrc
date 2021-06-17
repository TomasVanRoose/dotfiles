export PATH="/usr/local/sbin/:/usr/local/opt/python/libexec/bin:/usr/local/opt/llvm/bin:/usr/local/opt/ruby/bin:/usr/local/opt/openjdk/bin:$HOME/.cargo/bin:/Library/TeX/texbin:$PATH"
#export ZSH=$HOME/.oh-my-zsh

eval "$(starship init zsh)"

#plugins=(git z zsh-autosuggestions osx)


# Plugin manager
source "$HOME/.miniplug/miniplug.zsh"

miniplug plugin 'zsh-users/zsh-autosuggestions'
#miniplug plugin 'github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git'

miniplug load

# Autocomplete
autoload -U compaudit compinit
compinit

# History
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
setopt inc_append_history
setopt share_history

# User config
export DEFAULT_USER=`whoami`

#unsetopt menu_complete   # do not autoselect the first completion entry
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

source $HOME/.completion.zsh

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

# Pyenv // THIS IS DEPRECATED
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
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"

# Fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ARDMK_DIR=/usr/local/opt/arduino-mk

# Splashscreen
clear
greeter $(tput cols)
