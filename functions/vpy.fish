function vpy -d "Open all python files in the argument directory (default .) in tabs"
    if test (count $argv) -ne 0
        set dir $argv[1]
    else
        set dir .
    end

    vim -p (find $dir -maxdepth 1 -iname '*.py' ! -name '__init__.py')
end
