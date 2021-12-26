function fish_prompt
	set_color bbb
	echo -n (string repeat -n "$fish_nesting_level" '█')
	set_color normal

	if [ $USER = 'root' ]
		echo -n '🩸 '
	else
		set_color ccc
		echo -n '█ '
		set_color normal
	end
end
