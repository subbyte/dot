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

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# git info and auto-complete support
autoload -Uz vcs_info
autoload -Uz compinit
zstyle ':vcs_info:git:*' formats ' {%b}'

# execute vcs_info before PROMPT eval
precmd() {
    vcs_info
    compinit
    if [ ! -z $STY ]; then psvar[1]=" [$(echo $STY | awk -F"." '{ print $2}')]"; else psvar[1]=""; fi
    if [ ! -z ${VIRTUAL_ENV} ]; then psvar[2]=" ($(basename $VIRTUAL_ENV))"; else psvar[2]=""; fi
    psvar[3]=$vcs_info_msg_0_
}

printf '\n%.0s' {1..100}

PROMPT='
%F{241}%n@%F{113}%m:%F{241}%~%F{113}%1v%F{206}%2v%F{033}%3v%f
%# '
