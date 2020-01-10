# Defined in /var/folders/r_/3vv7gfs93tg9xq8dfr83lfpm0000gn/T//fish.o5ZRH5/fgkill.fish @ line 2
function fgkill
	set pid (jobs --last --pid)
	set flag $argv[1]
	if [ -n $flag ]
		kill -(string upper $flag) $pid
	else
		kill $pid
	end
end
