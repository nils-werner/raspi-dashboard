#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias halt='sudo halt'
PS1='[\u@\h \W]\$ '

export EDITOR="vim"
