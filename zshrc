# disable default handling of Python virtualenv (prepending name to PROMPT)
export VIRTUAL_ENV_DISABLE_PROMPT=true

# vi mode
bindkey -v

# enable 100 lines of history
export HISTFILESIZE=100
export HISTSIZE=100
export HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# alias definitions
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# git info and auto-complete support
autoload -Uz vcs_info
autoload -Uz compinit
zstyle ':vcs_info:git:*' formats ' {%b}'

# execute vcs_info before PROMPT eval
precmd() {
    vcs_info
    compinit
    psvar[1]=$vcs_info_msg_0_
    if [ ! -z ${VIRTUAL_ENV} ]; then psvar[2]=" ($(basename $VIRTUAL_ENV))"; fi
}

printf '\n%.0s' {1..100}

PROMPT='
%F{241}%n@%F{113}%m:%F{241}%~%F{033}%1v%F{206}%2v%f
%# '
