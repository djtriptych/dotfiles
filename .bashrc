# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\u@\h:\w \$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
