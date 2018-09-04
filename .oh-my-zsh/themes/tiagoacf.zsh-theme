local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT=' %{$fg[cyan]%}%c%{$reset_color%}$(git-radar --zsh --fetch)
${ret_status} '
RPROMPT='$(date "+%a, %R") [$(battery_pct_remaining)%%]($(battery_time_remaining))'

