function vag -d "Open files containing string"
    vim +/$argv[(count $argv)] (ag -l $argv)
end
