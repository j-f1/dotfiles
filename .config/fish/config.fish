##############
# virtualenv #
##############
eval (python -m virtualfish) # virtualenv

#############
# Powerline #
#############
set powerline_root /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
set fish_function_path $fish_function_path "$powerline_root/powerline/bindings/fish"
powerline-setup

#######
# pip #
#######
function __fish_complete_pip
  set -lx COMP_WORDS (commandline -o) ""
  set -lx COMP_CWORD (math (contains -i -- (commandline -t) $COMP_WORDS)-1)
  set -lx PIP_AUTO_COMPLETE 1
  string split \  -- (eval $COMP_WORDS[1])
end
complete -fa "(__fish_complete_pip)" -c pip

########
# less #
########
function l
  pygmentize -g -f terminal256 $argv | command less -R
end

###############
# Default cwd #
###############
if [ $PWD = $HOME ]
  cd Documents/Jed_Folder/github-clones
end

#######
# npx #
#######
# run npx by default when a command isn’t found
source (npx --shell-auto-fallback fish | psub)

##############
# npm Canary #
##############

function npm
  if which -s npmc
    npmc $argv
  else
    command npm $argv
  end
end

function npx
  if which -s npxc
    npxc $argv
  else
    command npx $argv
  end
end

#########
# pushd #
#########
function c
  pushd $argv
end
function pd
  popd $argv
end
rvm default


#########
# TITLE #
#########
function fish_title
  set name (basename (pwd))
  if [ "$_" = 'fish' ]
    echo $name
  else
    echo $name '→' $_
  end
end


# deprecated
function screen
  echo "Use hotel instead!"
  command screen $argv
end

######
# MD #
######

function md
  pandoc $argv | lynx -stdin -lss ~/.config/lynx.lss -display_charset=UTF-8
end

##########
# Pipenv #
##########

eval (pipenv --completion)

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/hayfields/.config/yarn/global/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish ]; and . /Users/hayfields/.config/yarn/global/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish