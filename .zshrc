# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

is_linux () {
  [[ $('uname') == 'Linux' ]];
}

is_osx () {
  [[ $('uname') == 'Darwin' ]]
}

ZSH_THEME="powerlevel10k/powerlevel10k"
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

# nvm
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if is_osx; then 
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  export PATH=/opt/homebrew/bin:$PATH
fi

if is_osx; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

if is_linux; then
    export PATH=$PATH:$HOME/.git-radar
    export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/
fi

# gpg
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

alias shrug='echo "¯\_(ツ)_/¯"'
#alias cat='bat'
alias tr2='tree -L 2'

#kubernetes alias
alias k='kubectl'
alias kgp='kubectl get pods'
alias kd='kubectl describe'	

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.zshrc_work ]] || source ~/.zshrc_work


export PATH=$PATH:~/bin:~/code/scripts
