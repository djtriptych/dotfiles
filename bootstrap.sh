#!/usr/bin/env bash

DIR_BACKUP="$HOME/.dotfiles/backup"
DIR_REPO="$HOME/.dotfiles/repo"
GIT_REPO_URL="git://github.com/djtriptych/dotfiles.git"
GIT_PUSH_URL="https://github.com/djtriptych/dotfiles.git"

# Make required directories
function make_dirs () {
  DIRS=( $DIR_REPO $DIR_BACKUP )
  echo Creating ${#DIRS[@]} required directories...
  for DIR in ${DIRS[@]};
  do
    mkdir -p $DIR;
  done;
  echo 'OK'
}

# Pull git repo if it hasn't been pulled yet or if working directory is clean.
function git_pull () {
  if [ ! -d $DIR_REPO/.git ]; then
    pushd $DIR_REPO > /dev/null
    git clone $GIT_REPO_URL .
    git remote set-url --push origin $GIT_PUSH_URL
    popd
  else
    pushd $DIR_REPO > /dev/null
    echo 'Pulling new files'
    git pull
    pull_result=$?
    popd
    if [ $pull_result -ne 0 ]; then 
      echo 'Pull failed! Check for local edits'
      exit 1
    fi
  fi
}

# Backup dotfiles before replacing
# args: 
#       $1 file_or_dir
function backup () {
  cp -r --backup=numbered $1 $DIR_BACKUP/$(basename $1)
  exit $?
}

# Loop through files in repo...
# If file also exists in $HOME, backup and replace.
# Create symlink
function link_files () {
  for f in $(ls -A $DIR_REPO/dotfiles)                  # List files except . and ..
    do
    if [ ${f:0:1} == "." ]; then                        # File starts with '.' ?
        g=$HOME/$(basename $f)
        if [ -e $g ]; then                              # File exists in $HOME ?
          backup $HOME/$(basename $f)                   # If so, backup first
          if [ $? -eq 0 ]; then
            ln --force $DIR_REPO/dotfiles/$f $HOME/$f
          else
            echo "failed to backup ~/$f"
          fi
        else
          ln --force $DIR_REPO/dotfiles/$f $HOME/$f
        fi
    fi
  done
}

make_dirs
git_pull
link_files
