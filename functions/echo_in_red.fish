function echo_in_red -d "For error printing in red"
    set_color red
    echo $argv
    set_color normal
end
