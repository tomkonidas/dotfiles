#------------------------------------------------------------------------------
# .profile
# Author: Tom Konidas <tomkonidas@protonmmail.ch>
# shellcheck shell=sh
#------------------------------------------------------------------------------

# Enable IEx shell history
export ERL_AFLAGS='-kernel shell_history enabled'

# Erlang config options
export KERL_CONFIGURE_OPTIONS='--without-javac --without-jinterface --without-odbc --without-hipe'
export KERL_BUILD_DOCS='yes'

if [ -x "$(command -v nvim)" ]; then
  export EDITOR='nvim'
elif [ -x "$(command -v vim)" ]; then
  export EDITOR='vim'
elif [ -x "$(command -v vi)" ]; then
  export EDITOR='vi'
fi
