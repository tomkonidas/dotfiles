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

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Enable iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Erlang config options
export KERL_CONFIGURE_OPTIONS="--without-javac --without-jinterface --without-odbc --without-hipe"
export KERL_BUILD_DOCS=yes

# asdf - Manage multiple runtime versions with a single CLI tool
. $HOME/.asdf/asdf.sh

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

export VISUAL=nvim
export EDITOR="$VISUAL"

# direnv - Load/unload environment variables based on $PWD
eval "$(direnv hook zsh)"

# postgresql
export PATH="/usr/local/opt/libpq/bin:$PATH"

CLOUD_SDK_HOME=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
source "${CLOUD_SDK_HOME}/path.zsh.inc"
source "${CLOUD_SDK_HOME}/completion.zsh.inc"
