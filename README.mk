dotfiles - sync config files across computers. 

FEATURES:

  - Direct edits to files in $HOME are reflected in the git repo and saved there.
        - This is done via symlinks - dotfiles in $HOME dir are actually
          symbolic links to the git repo.


SYSTEM DIRECTORIES: 

  - $HOME/.dotfiles
    The main dotfiles dir. Also a git repo: new changes are put here.

  - $HOME/repo
    The git repo holding all dotfiles. Having a standard location makes the
    bootstrap process a bit easier.

  - $HOME/.dotfiles/backup
    When conflict are detected, we save copies here. This is also a git repo
    which is updated on every backup.
    

COMMANDS:

  dotsync - sync up dotfiles from git repo to $HOME, backing up conflicting files.


PROBLEMS:
  
  Make sure we dont clobber anything, ever.
        - Backup everything with cp --backup=t to create numbered backups.

  How to include hostname-specific settings?
        - /hostnames dir in repo. We can then test for machine name and source
          them in as part of a build process.
  
COMMON TASKS:
  
  - Adding new dotfiles to repo.
    1. Copy new dotfile to repo.
    2. Run dotsync

CONFLICT RESOLUTION:

  If the file is not a symlink to ~/.dotfiles, there is a conflict.
