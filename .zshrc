#------------------------------------------------------------------------------
# .zshrc
# Author: Tom Konidas <tomkonidas@protonmmail.ch>
#------------------------------------------------------------------------------

DEFAULT_USER=$(whoami)

# Antigen - Plugin manager for zsh
if [[ -f '/usr/local/share/antigen/antigen.zsh' ]]; then
  source '/usr/local/share/antigen/antigen.zsh'
  # Load the oh-my-zsh's library
  antigen use oh-my-zsh
  antigen bundle git
  antigen bundle common-aliases
  antigen bundle command-not-found
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting

  antigen theme robbyrussell

  antigen apply
fi

if [[ -f "$HOME/.aliases" ]]; then
  source "$HOME/.aliases"
fi

if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  source "$HOME/.asdf/asdf.sh"
fi

if [[ -x "$(command -v direnv)" ]]; then
  eval "$(direnv hook zsh)"
fi

# Yubikey
yubikey_sync(){
  gpg-connect-agent 'scd serialno' 'learn --force' /bye
}

secret() {
  output=~/"${1}".$(date +%s).enc
  gpg --encrypt --armor --output ${output} -r 0x0000 -r 0x0001 -r 0x0002 "${1}" \
    && echo "${1} -> ${output}"
}

reveal() {
  output=$(echo "${1}" | rev | cut -c16- | rev)
  gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

# postgresql
# export PATH="/usr/local/opt/libpq/bin:$PATH"

# CLOUD_SDK_HOME=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
# source "${CLOUD_SDK_HOME}/path.zsh.inc"
# source "${CLOUD_SDK_HOME}/completion.zsh.inc"
