# Defined in /var/folders/r_/3vv7gfs93tg9xq8dfr83lfpm0000gn/T//fish.AMs4W5/fish_prompt.fish @ line 2
function fish_prompt
	if [ $USER = 'root' ]
		echo -n '🩸 '
	else
		set_color ccc
		echo -n '█ '
		set_color normal
	end
end
