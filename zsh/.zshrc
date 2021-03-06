# Antigen - Plugin manager for zsh, inspired by oh-my-zsh and vundle
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

DEFAULT_USER=`whoami`

# Enable iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Erlang config options
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

# asdf - Manage multiple runtime versions with a single CLI tool
. /usr/local/opt/asdf/asdf.sh

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

# direnv - Load/unload environment variables based on $PWD
eval "$(direnv hook zsh)"
