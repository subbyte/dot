# disable default handling of Python virtualenv (prepending name to PROMPT)
export VIRTUAL_ENV_DISABLE_PROMPT=true

# vi mode
bindkey -v

# history
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# built-in aliases
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'

# more aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# auto complete
autoload -Uz compinit
compinit

# git info and auto-complete support
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' {%b}'

# execute vcs_info before PROMPT eval
precmd() {
    vcs_info
    if [ ! -z $STY ]; then psvar[1]=" [$(echo $STY | awk -F"." '{ print $2}')]"; else psvar[1]=""; fi
    if [ ! -z ${VIRTUAL_ENV} ]; then psvar[2]=" ($(basename $VIRTUAL_ENV))"; else psvar[2]=""; fi
    psvar[3]=$vcs_info_msg_0_
}

printf '\n%.0s' {1..100}

PROMPT='
%F{241}[%D{%z %H:%M:%S}] %n@%F{113}%m:%F{241}%~%F{113}%1v%F{206}%2v%F{033}%3v%f
%# '
