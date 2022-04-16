#------------------------------------------------------------------------------
# .bashrc
# Author: Tom Konidas <tomkonidas@protonmmail.ch>
# shellcheck shell=bash
#------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [[ -f "$HOME/.aliases" ]]; then
  source "$HOME/.aliases"
fi

if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  source "$HOME/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi

if [[ -x "$(command -v direnv)" ]]; then
  eval "$(direnv hook bash)"
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
