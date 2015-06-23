set fish_greeting ""

#######################
#  paths and aliases  #
#######################

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
    bind \ev 'edit_cmd'
    fzf_key_bindings
end

set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'

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

if type -f dircolors >/dev/null
    # eval (dircolors -c ~/.dir_colors.light)
    eval (dircolors -c ~/.dir_colors.dark)
end

set -x GREP_COLOR '37;45'

