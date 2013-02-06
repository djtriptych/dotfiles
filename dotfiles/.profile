################################################################################
# Mac OSX bash profile.
# 
# Author: Kenan Banks <github.com/djtriptych>
# 
# Format: 
#   - Header titles start with two octothorpes '##', are in title case, end with
#   no period, and are preceded by two blank lines.
#   - Header titles are immediately followed by 80 dashes.
#   - Cryptic lines should come with a cf. note for more info.
# 
################################################################################


## Path Stuff
--------------------------------------------------------------------------------
# MacPorts Installer addition on 2010-04-14_at_18:28:49: 
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Adding scripts I wrote.
export PATH=~/bin:$PATH




## Environment variables
--------------------------------------------------------------------------------

# When other programs need to launch an editor, it looks here.
export VISUAL="vim"

# Enable color in the terminal.
export CLICOLOR=1;

# Enable color in grep
export GREP_OPTIONS="--color=auto"

# Set a simple <pwd> $ prompt
export PS1='\w $ ';

# This file is executed before starting an interactive session
# It's NOT executed when there is a file argument to python -i
# cf. man python2.7
test -e ~/.python_startup && export PYTHONSTARTUP='~/.python_startup'




## Aliases
--------------------------------------------------------------------------------
# -a means include dotfiles; -l means long format
alias ls='ls -al'

# fix info's horrible keybindings.
alias info='info --vi-keys'




## Imports
--------------------------------------------------------------------------------
# VirtualEnv
ve=/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
test -e ve && source ve
unset ve
