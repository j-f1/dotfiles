function fish_right_prompt
  # set start_time (gdate "+%s%3N")
  set last_status $status
  if [ $last_status -ne 0 ]
    set_color brred
    echo -n "⌦ $last_status "
    set_color normal
  end

  if git rev-parse --is-inside-work-tree &> /dev/null
    set dirty (git status --porcelain --ignore-submodules -uno 2> /dev/null | wc -l | string trim)
    set new (git status --porcelain --ignore-submodules 2> /dev/null | grep -E '^(\\?\\?|A ) ' | wc -l | string trim)
    if [ $dirty -gt 0 ]
      set_color yellow
      echo -n " ● $dirty"
      set_color normal
    end
    if [ $new -gt 0 ]
      set_color green
      echo -n " ✚ $new"
      set_color normal
    end
  end
  # set delta_t (math (gdate "+%s%3N") - $start_time)
  # echo -n $delta_t

  if [ -n "$VIRTUAL_ENV" ]
    set venv (basename $VIRTUAL_ENV)
    set venv_path $VIRTUAL_ENV
  end

  # if command -sq pipenv
  #   set pipenv_where (pipenv --where 2> /dev/null)
  #   if not string match -i 'no pipfile present' $pipenv_where
  #     set venv $pipenv_where
  #   end
  # end

  if [ -n "$venv" ]
    echo -e -n "\0\0\033_venv:$venv\033\\"
    echo -e -n "\033_venv_path:$venv_path\033\\\0\0"
  end
end
