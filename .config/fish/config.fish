set last_time (gdate "+%s%3N")
function __s
  echo (math (gdate "+%s%3N") - $last_time)
  echo -n "Loading $argv... "
  set last_time (gdate "+%s%3N")
end

##########
# fisher #
##########
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

#######
# pip #
#######
__s pip
function __fish_complete_pip
  set -lx COMP_WORDS (commandline -o) ""
  set -lx COMP_CWORD (math (contains -i -- (commandline -t) $COMP_WORDS)-1)
  set -lx PIP_AUTO_COMPLETE 1
  string split \  -- (eval $COMP_WORDS[1])
end
complete -fa "(__fish_complete_pip)" -c pip

###############
# Default cwd #
###############
__s pwd
if [ $PWD = $HOME ]
  cd Documents/Jed_Folder/github-clones
end

#######
# npx #
#######
__s npx fallback
# run npx by default when a command isn’t found
# (result of npx --shell-auto-fallback)
function __fish_command_not_found_on_interactive --on-event fish_prompt
  functions --erase __fish_command_not_found_handler
  functions --erase __fish_command_not_found_setup

  function __fish_command_not_found_handler --on-event fish_command_not_found
    if which npx > /dev/null
        echo "$argv[1] not found. Trying with npx..." >&2
    else
        return 127
    end
    if string match -q -r @ $argv[1]
        npx $argv
    else
        npx --no-install $argv
    end
  end

  functions --erase __fish_command_not_found_on_interactive
end

#######
# rvm #
#######
__s rvm
rvm default &

##########
# Pipenv #
##########

__s pipenv
eval (pipenv --completion)

__s electron-forge
# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/hayfields/.config/yarn/global/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish ]; and . /Users/hayfields/.config/yarn/global/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish

__s done
