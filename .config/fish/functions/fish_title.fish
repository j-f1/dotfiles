# Defined in /var/folders/r_/3vv7gfs93tg9xq8dfr83lfpm0000gn/T//fish.8RgMN9/fish_title.fish @ line 2
function fish_title
	set name (basename (pwd))
	set cmd (status current-command)
	if [ "$TERM_PROGRAM" = 'Apple_Terminal' ]
		if [ "$cmd" != 'fish' ]
			echo $cmd
		else
			echo ''
		end
	else if [ "$TERM_PROGRAM" = 'vscode' ]
		set repo_root (git rev-parse --show-toplevel 2> /dev/null)
		if [ $status = 0 ] && [ "$repo_root" != (pwd) ]
			# echo (basename "$repo_root")"/"(realpath --relative-to="$repo_root" (pwd))": $cmd"
			echo (realpath --relative-to="$repo_root" (pwd))": $cmd"
		else
			echo "$name: $cmd"
		end
	else
		if [ "$cmd" = 'fish' ]
			echo $name
		else
			echo $name '→' $cmd
		end
	end
end
