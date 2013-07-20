################################################################################
# Mac OSX bash profile.
#
# Author: Kenan Banks <github.com/djtriptych>
#
# Format:
#   - Header titles start with two octothorpes '##', are in title case, end with
#   no period, and are preceded by four blank lines.
#   - Header titles are immediately followed by an 80 octothorpe line..
#   - Cryptic lines should come with a cf. note for more info.
#
################################################################################



## Path Stuff
################################################################################
# MacPorts Installer addition on 2010-04-14_at_18:28:49:
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Adding scripts I wrote.
export PATH=~/bin:~/bin/scripts:$PATH




## Environment variables
################################################################################

# When other programs need to launch an editor, it looks here.
export VISUAL="vim"

# Enable color in the terminal.
export CLICOLOR=1;

# Enable color in grep
export GREP_OPTIONS="--color=always"

# Enable color in less
export LESS="-R"

# Set a simple <pwd> $ prompt
# export PS1='\w  ⚡';
export PS1='\[\033[00;38;5;4m\]\w \[\033[01;37m\]⚡ \[\033[00m\]'

# Directory shortcut names ftw :)
export CDPATH=~/symlinks

# This file is executed before starting an interactive session
# It's NOT executed when there is a file argument to python -i
# cf. man python2.7
test -e ~/.python_startup && export PYTHONSTARTUP='~/.python_startup'




## aliases
################################################################################
# -a means include dotfiles; -l means long format
alias ls='ls -al --color=auto'

# fix info's horrible keybindings.
alias info='info --vi-keys'




## Options
################################################################################

# Navigate & edit command line with vim keystrokes. Fuck yes.
set -o vi

if [[ $DISPLAY ]]; then
# Map caps lock key to ctrl
setxkbmap -option ctrl:nocaps
fi

# Raise keyboard rate and lower interval?




## Python
################################################################################
# Add local modules to search path.
PYTHONPATH=$HOME/bin




## Functions
################################################################################




## Imports
################################################################################
# VirtualEnv
ve=/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
test -e ve && source ve
unset ve

# export TERM="xterm-256color"
# export TERM="rxvt-unicode-256color"
export G3DIR=/usr/local/google/home/kenan/git/dfa7fe/google3
export DFA=java/com/google/ads/xfa/site
export XFA=java/com/google/ads/xfa
alias cdd='cd $G3DIR/$DFA'
source $G3DIR/$DFA/.bash-helpers

# Maintain a branch to constantly track master
export XFA_MASTER=/usr/local/google/home/kenan/git/dfa-master/google3/$XFA
export G3DIR_MASTER=/usr/local/google/home/kenan/git/dfa-master/google3


