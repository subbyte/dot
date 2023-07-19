. /etc/ksh.kshrc

txtreset="$(tput sgr0)"
txtgrey="$(tput setaf 241)"
txtgreen="$(tput setaf 118)"

# OpenBSD<7.3
#txtgrey="$(tput setaf 241 1 1)"
#txtgreen="$(tput setaf 118 1 1)"

PS1="\n\[$txtgrey\][\D{%z %H:%M:%S}\[$txtgrey\]]"
PS1="$PS1 \u@\[$txtgreen\]\h\[$txtgrey\]:\w"
PS1="$PS1\[$txtreset\]"
PS1="$PS1\n\\$ "

set -o vi

alias ll="ls -l"
alias la="ls -la"
alias vi="vim"
