function cl -d "Change directory and ls"
    if test (count $argv) -eq 0
        builtin cd; and ls
    else
        builtin cd $argv; and ls
    end
end
