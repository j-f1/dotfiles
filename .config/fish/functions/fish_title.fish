# Defined in /Users/hayfields/.config/fish/config.fish @ line 127
function fish_title
	set name (basename (pwd))
  if [ "$_" = 'fish' ]
    echo $name
  else
    echo $name '→' $_
  end
end
