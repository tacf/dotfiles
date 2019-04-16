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

export GPG_TTY=(tty)
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
