# see https://github.com/fish-shell/fish-shell/issues/393
function make_completion --argument alias command
    complete -c $alias -xa "(
    set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
    complete -C\"$command \$cmd\";
    )"
end
