# Defined in /var/folders/r_/3vv7gfs93tg9xq8dfr83lfpm0000gn/T//fish.w478KX/ql.fish @ line 2
function ql
    qlmanage -p -x $argv 2>/dev/null >/dev/null &
end
