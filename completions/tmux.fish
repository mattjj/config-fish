function __fish_tmux_sessions
    tmux list-sessions -F "#S"
end

complete -c tmux -f -n "__fish_contains_opt -s t" -a "(__fish_tmux_sessions)" -d 'Session'
