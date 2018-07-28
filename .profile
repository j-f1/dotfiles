
# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.5/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

alias python2.5=/Library/Frameworks/Python.framework/Versions/2.5/bin/python2.5 
PATH="~/bin:${PATH}"

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PYTHONSTARTUP='/Users/'$USER'/python_profile.py'
export VIRTUALENV_PROMPT='(\[\033[31m\]venv:\[\033[1m\]`basename \"$VIRTUAL_ENV\"`\033[00m\]) '

export DJANGO_COLORS="light"
source $HOME/.django-bash-completion

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias plr='powerline-daemon --replace'

source ~/.git-completion.sh

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# Change |> to $ if not using Fira Code.
# export PS1="\[\033[01;32m\]\u\]\033[00m\]: \[\033[01;34m\]\W$(__git_ps1 " (%s)") |>\[\033[00m\] "
#     from Pi ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ^.git-completion.sh^ ^^^^^^^^^^^^^^^
export PS1="\033[34mbash\033[39m\033[90m:\033[39m \033[32m\W$(__git_ps1 " (%s)")\033[39m \033[31m✝\033[39m "

## Disabled to differentiate between fish and bash
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
##

##
# Your previous ~/.bash_profile file was backed up as ~/.bash_profile.macports-saved_2016-12-17_at_18:28:24
##

# MacPorts Installer addition on 2016-12-17_at_18:28:24: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/usr/local/bin:$PATH

# nvm use --silent default
alias git=hub

export PATH="$HOME/.yarn/bin:$PATH"

cd Documents/Jed_Folder/github-clones

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
