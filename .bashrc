# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

PS1="\e[0;32m\][\u@() \W]\\$ \e[0;37m\]"

alias s='ssh'
alias t='tmux'
alias ta='tmux a -t'
alias tns='tmux new-session -s'
