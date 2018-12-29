# Defined in /var/folders/5m/700gk8j97pb5btm8k4xczcg40000gn/T//fish.N5Q3fR/fish_title.fish @ line 2
function fish_title
	set name (basename (pwd))
	set cmd (status current-command)
  if [ "$cmd" = 'fish' ]
    echo $name
  else
    echo $name '→' $cmd
  end
end
