# NOTE: I override the built-in function because I needed the output not to
# overlap with my two-line prompt. In particular, one must 'echo' before the
# repaint is issued. Many cleaner solutions exist I am sure!

#
# This function is bound to Alt-L, it is used to list the contents of
# the directory under the cursor
#

function __fish_list_current_token -d "List contents of token under the cursor if it is a directory, otherwise list the contents of the current directory"
    echo
    set val (eval echo (commandline -t))
    if test -d $val
        ls $val
    else
        set dir (dirname $val)
        if test $dir != . -a -d $dir
            ls $dir
        else
            ls
        end
    end
    echo
    commandline -f repaint
end


