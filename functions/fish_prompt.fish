function fish_prompt
   set_color blue
   printf '%s' (whoami)
   set_color normal

   printf ' at '
   set_color yellow
   printf '%s' (hostname|cut -d . -f 1)
   set_color normal

   printf ' in '
   set_color $fish_color_cwd
   printf '%s' (echo $PWD | sed -e "s|^$HOME|~|")
   set_color normal

   __fish_git_prompt " on %s"

   echo

   printf '○ '
   set_color normal

   autojump -a $PWD > /dev/null &
end
