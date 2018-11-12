# Defined in /Users/hayfields/.config/fish/config.fish @ line 20
function fish_right_prompt
	set last_status $status
  if test $last_status -ne 0
    set_color -b 680000
    set_color brwhite
    echo -n " * $last_status * "
    set_color normal
  end
end
