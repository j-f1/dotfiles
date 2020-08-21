# Defined in /var/folders/r_/3vv7gfs93tg9xq8dfr83lfpm0000gn/T//fish.RCAMI1/fgkill.fish @ line 2
function fgkill
	set pid (jobs --last --pid)
	kill $argv $pid
	fg $pid
end
