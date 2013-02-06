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
  echo BACKUP $1
  cp -r --backup=numbered $1 $DIR_BACKUP/$(basename $1)
}

# Loop through files in repo...
# If file also exists in $HOME, backup and replace.
# Create symlink
function link_files () {
  for f in  $(ls -A $DIR_REPO/dotfiles)                 # List files except . and ..
    do
    if [ ${f:0:1} == "." ]; then                        # File starts with '.' ?
        h=$HOME/$f
        if [ -e $h ]; then                              # File exists in $HOME ?
          backup $HOME/$f
          if [ $? -eq 0 ]; then
            ln -s --force $DIR_REPO/dotfiles/$f $HOME/$f
            echo LINKED $HOME/$f
          else
            echo "Failed to backup ~/$f"
          fi
        else
          ln -s --force $DIR_REPO/dotfiles/$f $HOME/$f
          echo LINKED $HOME/$f
        fi
    fi
  done
}

make_dirs
git_pull
link_files
