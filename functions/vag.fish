function vag -d "Open files containing string"
    vim -p +/$argv[(count $argv)] (ag -l $argv)
end
