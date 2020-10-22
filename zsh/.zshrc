# Antigen - Plugin manager for zsh, inspired by oh-my-zsh and vundle
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

DEFAULT_USER=`whoami`

# asdf - Manage multiple runtime versions with a single CLI tool
. /usr/local/opt/asdf/asdf.sh

# direnv - Load/unload environment variables based on $PWD
eval "$(direnv hook zsh)"
