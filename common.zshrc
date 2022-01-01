
setopt prompt_subst
autoload -Uz add-zsh-hook

PS1="%B%n@%m %c\$vcs_info_msg_0_ %#%b "
RPROMPT="%B\$(rprompt_exit_status)%b"

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }

rprompt_exit_status() {
  _status=$?
  if [ $_status = 0 ]; then
    echo -n "('-'*)"
  else
    echo -n "%F{red}$_status (\`-´#)%f"
  fi
}

alias g="git grep --no-index -ni"
alias d="git diff --no-index -b"

autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit
