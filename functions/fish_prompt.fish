function fish_prompt
   set_color blue
   echo -n (whoami)
   set_color normal

   echo -n ' at '
   set_color yellow
   echo -n (hostname|cut -d . -f 1)
   set_color normal

   echo -n ' in '
   set_color $fish_color_cwd
   echo -n (pwd | sed -e "s|^$HOME|~|")
   set_color normal

   __fish_git_prompt " on %s"

   echo

   echo -n '○ '
   set_color normal

   autojump -a $PWD > /dev/null &
end
