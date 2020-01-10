# Defined in /var/folders/r_/3vv7gfs93tg9xq8dfr83lfpm0000gn/T//fish.Da9Vug/fish_title.fish @ line 2
function fish_title
	set name (basename (pwd))
	set cmd (status current-command)
	if [ "$TERM_PROGRAM" = 'Apple_Terminal' ]
		if [ "$cmd" != 'fish' ]
			echo $cmd
		else
			echo ''
		end
	else
		if [ "$cmd" = 'fish' ]
			echo $name
		else
			echo $name '→' $cmd
		end
	end
end
