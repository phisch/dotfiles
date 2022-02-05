#!/usr/bin/env zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,cmd -w -w"

zstyle -e ':completion:*' hosts 'reply=($myhosts)'

autoload -U compinit && compinit
zmodload -i zsh/complist

unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt interactivecomments
setopt share_history

setopt inc_append_history
setopt share_history

# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[[A" history-beginning-search-backward-end # up
bindkey "^[[B" history-beginning-search-forward-end # down

bindkey "^[[3~" delete-char # del
bindkey "^[[3;5~" delete-word # ctrl + del
bindkey "^H" backward-delete-word # ctrl + backspace

bindkey "^[[5~" up-line-or-history # pgup
bindkey "^[[6~" down-line-or-history # pgdown

bindkey "^[[5;5~" beginning-of-history # ctrl + pgup
bindkey "^[[6;5~" end-of-history # ctrl + pgdown

bindkey "^[[1;5D" backward-word # ctrl + left
bindkey "^[[1;5C" forward-word # ctrl + right

bindkey "^[[1;3D" backward-word # alt + left
bindkey "^[[1;3C" forward-word # alt + right

bindkey "^[[1;6D" beginning-of-line # ctrl + shift + left
bindkey "^[[1;6C" end-of-line # ctrl + shift + right

bindkey "^[[H" beginning-of-line # pos1
bindkey "^[[F" end-of-line # end

# color manpages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

session() {
  echo "%F{blue}$USER%F{reset}@%F{green}$HOST "
}

path() {
  echo "%F{blue}%~%f"
}

git_status() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{242} 󰘬$BRANCH"
    [ ! -z "$(git status --short)" ] && echo -n "%F{white}*%f"
  fi
}

prompt() {
  echo '%(?.%f.%F{red})❯%f '
}

PS1='$(session)$(path)$(git_status) $(prompt)'

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
path+=("$GEM_HOME/bin")

path+=(~/.cargo/bin)

export npm_config_prefix="$HOME/.local"
path+=($HOME/.local/bin)

export PATH

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export EDITOR="nano"