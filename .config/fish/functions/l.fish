# Defined in /Users/hayfields/.config/fish/config.fish @ line 46
function l
	pygmentize -g -f terminal256 $argv | command less -R
end
