function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    echo -n (git-radar --fish --fetch)
    set_color normal
    echo -n ' > '
end


function fish_greeting
	echo 'hmm, unresolved split-brain - 2018-06-08 16:44'
end

# ALIAS
alias cat=bat
alias dck "docker"

# ALIAS AWS
alias ec2-ls "aws ec2 describe-instances --query \"Reservations[*].Instances[*].{Name:Tags[?Key==`Name`].Value[] | [0], PublicIP:PublicIpAddress, PrivateIP:PrivateIpAddress Status:State.Name}\""

# Path
set PATH $PATH $HOME/bin $HOME/.cargo/bin

# AUTH Tooling
export GPG_TTY=(tty)
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Pyenv related
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
status --is-interactive; and source (pyenv init -|psub)



test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

