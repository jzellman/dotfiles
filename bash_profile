# vim:ft=sh:
if [ -r ~/.profile ]; then
  source ~/.profile
fi

if [ -r ~/.bash_funcs ]; then
  source ~/.bash_funcs
fi

export CLICOLOR=1
export HISTCONTROL=ignoreboth
export EDITOR=vim

PATH=~/bin:"$PATH"
PATH=bin:"$PATH"
export PATH

export IDEA_VM_OPTIONS=~/.idea64.vmoptions

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" # This loads nvm on a mac installed via homebrew

_git_prompt() {
  local ref="$(command git symbolic-ref -q HEAD 2>/dev/null)"
  if [ -n "$ref" ]; then
    echo " (${ref#refs/heads/})"
  fi
}

_failed_status() {
  [ "$PIPESTATUS" -ne 0 ] && printf "$"
}

_success_status() {
  [ "$PIPESTATUS" -eq 0 ] && printf "$"
}

PS1='\[\e[0;31m\]\w\[\e[m\]$(_git_prompt) \[\e[1;31m\]$(_failed_status)\[\e[m\]$(_success_status) '

# Allow <C-s> to pass through to shell and programs
stty -ixon -ixoff
export PATH=$PATH:/usr/local/sbin:

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
     eval "$(pyenv init -)"
fi
