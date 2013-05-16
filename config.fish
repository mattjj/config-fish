set fish_greeting ""

###########
#  paths  #
###########

if begin; status --is-login; and test -z $TMUX; end
    set -x EDITOR vim
    set -x VISUAL vim

    set -x PATH "$HOME"/bin/{,todo/} $PATH

    set -x CDPATH . "$HOME" $CDPATH

    if test -e ~/builds/julia;
        set -x PATH ~/builds/julia $PATH
    end

    if test (uname) = Darwin
        set -x PATH /opt/local/{libexec/gnubin,bin,sbin}/ \
            /opt/local/Library/Frameworks/Python.framework/Versions/Current/bin/ \
            $PATH
        set -x PYTHONPATH ~/Library/Python
        set -x MANPATH /opt/local/share/man $MANPATH
    end
end

##################
#  key bindings  #
##################

function fish_user_key_bindings
    bind \e\[1\;9A 'history-token-search-backward'
    bind \e\[1\;9C 'forward-word'
    bind \e\[1\;9D 'backward-word'
end

#############
#  aliases  #
#############

alias v='vim'
alias vv='vim -u NONE'
alias pl='ipython --pylab'
alias top='htop'
alias cloc='cloc --exclude-dir=.git'
alias scheme='rlwrap -r -c -b" " -f "$HOME"/.scheme_completion.txt scheme'
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias gfm='github-flavored-markdown.rb'
alias less='less -r'
alias gb='git branch'
alias gco='git checkout'
alias gca='git commit --all'

make_completion gb 'git branch'
make_completion gco 'git checkout'
make_completion gca 'git commit --all'
make_completion pcat 'cat'

##########
#  misc  #
##########

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function j
    cd (command autojump $argv)
end

if not set -q LS_COLORS
    if type -f dircolors >/dev/null
        # eval (dircolors -c ~/.dir_colors.light)
        eval (dircolors -c ~/.dir_colors.dark)
    end
end

set -x GREP_COLOR '37;45'

################
#  todo setup  #
################

set -x TODOFILE ~/Dropbox/todo/.todo
set -x TODOHISTORY ~/Dropbox/todo/.todo-history
alias t=todo
alias d=todone
alias tc=todos_completed
alias te="vim -p $TODOFILE $TODOHISTORY ~/.todo-stashed"
