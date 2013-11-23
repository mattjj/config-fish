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
        set -x MANPATH /opt/local/share/man /opt/local/man/ \
            /usr/local/share/man /usr/share/man /opt/X11/share/man $MANPATH

        set -x GOROOT /opt/local/go
        set -x GOPATH ~/bin/gocode/bin
        set -x PATH $PATH $GOPATH
    end
end

##################
#  key bindings  #
##################

function fish_user_key_bindings
    bind \e\[1\;9A 'history-token-search-backward'
    bind \e\[1\;9B 'history-token-search-forward'
    bind \e\[1\;9C 'forward-word'
    bind \e\[1\;9D 'backward-word'
    bind \cn 'forward-word'
    bind \cb 'backward-word'
end

#############
#  aliases  #
#############

alias v='vim'
alias vv='vim -u NONE'
alias pl='ipython --pylab'
alias cloc='cloc --exclude-dir=.git'
alias scheme='rlwrap -r -c -b" " -f "$HOME"/.scheme_completion.txt scheme'
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias gfm='github-flavored-markdown.rb'
alias less='less -R'
alias gb='git branch'
alias gco='git checkout'
alias gca='git commit --all'
alias gcb='git checkout -b'
alias ta='tmux a -t'

make_completion gb 'git branch'
make_completion gco 'git checkout'
make_completion gca 'git commit --all'
make_completion pcat 'cat'
make_completion ta 'tmux a -t'

#######################
#  coloring manpages  #
#######################

set -x LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -x LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -x LESS_TERMCAP_me \e'[0m'           # end mode
set -x LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -x LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -x LESS_TERMCAP_ue \e'[0m'           # end underline
set -x LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

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
alias te="vim $TODOFILE $TODOHISTORY ~/.todo-stashed"
