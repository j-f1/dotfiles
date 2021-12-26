set start_time (gdate "+%s%3N")

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
if [ $PWD = $HOME ]
  cd Documents/github-clones
end

##################
# shell fallback #
##################
# run npx or brew by default when a command isn’t found
# (result of npx --shell-auto-fallback and brew command-not-found-init)
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
        if [ $status -eq 127 ]
            # brew command-not-found
            set -l cmd $argv[1]
            set -l txt (brew which-formula --explain $cmd ^ /dev/null)

            if test -z "$txt"
                __fish_default_command_not_found_handler $cmd
            else
                # https://github.com/fish-shell/fish-shell/issues/159
                for var in $txt
                    echo $var
                end
            end
        end
    end
  end

  functions --erase __fish_command_not_found_on_interactive
end

#######
# rvm #
#######
## rvm default &

#########
# pyenv #
#########
# if command -v pyenv 1>/dev/null 2>&1
#   pyenv init - | source
# end

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/hayfields/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish ]; and . /Users/hayfields/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish
source /opt/homebrew/opt/asdf/asdf.fish

############
# swiftenv #
############
if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end

# Startup performance
set delta_t (math (gdate "+%s%3N") - $start_time)

if [ $delta_t -lt 100 ]
  set perf_color green
else if [ $delta_t -lt 500 ]
  set perf_color yellow
else
  set perf_color red
end

if status --is-interactive
  set_color grey
  echo -n session started in (set_color --bold --dim $perf_color){$delta_t}ms(set_color normal; set_color grey)
  echo -n " on" (set_color normal; date -R)
  echo
end
