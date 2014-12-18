################################################################################
# Bash profile.
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


## Top Imports
# Add git bash helpers.
source ~/.git-prompt.sh



## Path Stuff
################################################################################
# MacPorts Installer addition on 2010-04-14_at_18:28:49:
export PATH=~/go/bin:/opt/local/bin:/opt/local/sbin:$PATH
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


# Directory shortcut names ftw :)
export CDPATH=~/symlinks

# This file is executed before starting an interactive session
# It's NOT executed when there is a file argument to python -i
# cf. man python2.7
test -e ~/.python_startup && export PYTHONSTARTUP='~/.python_startup'




## Command Prompt.
################################################################################
# cf. http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/
# cf. `max rxvt` for escape sequences.

# Abbreviate long host names.
# Args:
#   $1 longhostname
# Returns:
#   shorter hostname if abbreviation is defined, else the long name.
function __host_abbr() {
  declare -A hosts
  hosts[kenangoobuntu]="google"
  hosts[bedstuy]="linode"

  if [[ -z "${hosts[$1]}" ]]
  then
    echo -n $1
    return 1
  fi

  echo -n ${hosts[$1]}
  return 0
}

export PS1='\[\e[0;38;5;13m\]\u\
\[\e[0;38;5;13m\]@\
\[\e[0;38;5;13m\]$( __host_abbr \h ):\
\[\e[0;38;5;6m\]\w\
\[\e[1;38;5;2m\]$(__git_ps1) \
\[\e[0;38;5;1m\]$ \[\e[0m\]'





## Aliases
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




## Go
################################################################################

export GOROOT=$HOME/go
export GOPATH=$HOME/gocode



## Trip and Chase
export MIX=$HOME/repos/tripandchase/mix


## Functions
################################################################################




## Imports
################################################################################
# VirtualEnv
ve=/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
test -e ve && source ve
unset ve
source ~/.virtualenvs/hx/bin/activate
export TERM=rxvt-unicode
