#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
alias cmatrix='cmatrix -C blue'

PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/tomkonidas/.cfg/ --work-tree=/home/tomkonidas'
