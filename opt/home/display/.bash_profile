#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ "$(tty)" = "/dev/tty1" ]] && exec startx
