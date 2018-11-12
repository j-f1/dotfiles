# Defined in /Users/hayfields/.config/fish/config.fish @ line 149
function md
	pandoc $argv | lynx -stdin -lss ~/.config/lynx.lss -display_charset=UTF-8
end
