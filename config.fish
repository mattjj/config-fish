set fish_greeting ""

#######################
#  paths and aliases  #
#######################

if begin; status --is-login; and test -z $TMUX; end
    set -x EDITOR vim
    set -x VISUAL vim

    set -x CDPATH . "$HOME" $CDPATH
end

if test -e ~/.config/fish/config_thismachine.fish
    source ~/.config/fish/config_thismachine.fish
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

