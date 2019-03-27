export ZSH=$HOME/.oh-my-zsh

is_linux () {
  [[ $('uname') == 'Linux' ]];
}

is_osx () {
  [[ $('uname') == 'Darwin' ]]
}

ZSH_THEME="tiagoacf"
plugins=(battery)

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

if is_osx; then
  bindkey "[D" backward-word # Alt + Arrow Left 
  bindkey "[C" forward-word # Alt + Arrow Right
fi

# User configuration

# Golang
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin/"
export GOPATH=$HOME/go
source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# gpg
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# nvm
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if is_osx; then 
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

if is_linux; then
	export PATH=$PATH:$HOME/.git-radar
    export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/
fi

alias shrug='echo "¯\_(ツ)_/¯"'
#alias cat='bat'
alias tr2='tree -L 2'
