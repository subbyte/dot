# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# vim
alias vi='vim'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# more aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# git completion
source /usr/share/bash-completion/completions/git

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# my style
set -o vi

# environment variables
export EDITOR=vi
export SVN_EDITOR=vi
export PYTHONSTARTUP=~/.pythonrc

parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ {\1}/'
}

parse_python_venv()
{
    if [ ! -z ${VIRTUAL_ENV} ]; then echo " ($(basename $VIRTUAL_ENV))"; fi
}

parse_screen_session()
{
    if [ ! -z $STY ]; then echo " [$(echo $STY | awk -F"." '{ print $2}')]"; fi
}

# Interactive prompt
set_prompt()
{
    local txtreset="$(tput sgr0)"
    local txtbold="$(tput bold)"
    local txtgrey="$(tput setaf 241)"
    local txtgreen="$(tput setaf 118)"
    local txtmagenta="$(tput setaf 206)"
    local txtblue="$(tput setaf 33)"
    local tolastline="$(tput cup $LINES)"
    
    PS1="\[$tolastline\]\n\[$txtgrey\][\D{%z %H:%M:%S}\[$txtgrey\]]"
    PS1+=" \u@\[$txtgreen\]\h\[$txtgrey\]:\w"
    PS1+="\[$txtgreen\]$(parse_screen_session)"
    PS1+="\[$txtblue\]$(parse_git_branch)"
    PS1+="\[$txtmagenta\]$(parse_python_venv)"
    PS1+="\[$txtreset\]"
    PS1+="\n\\$ "
}
PROMPT_COMMAND="set_prompt"
