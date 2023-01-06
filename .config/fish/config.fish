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
if [ $PWD = $HOME ] && [ -d Documents/github-clones ]
  cd Documents/github-clones
end

########
# asdf #
########
source /opt/homebrew/opt/asdf/libexec/asdf.fish

############
# swiftenv #
############
if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end

###########
# nesting #
###########
if set -q fish_nesting_level
  set -gx fish_nesting_level (math $fish_nesting_level + 1)
else
  set -gx fish_nesting_level 0
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -e /opt/homebrew/Caskroom/miniforge/base/bin/conda ]
  eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

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
