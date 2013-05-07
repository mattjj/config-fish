function vag -d "Open files containing string"
    vim -p (ag -l $argv)
end
