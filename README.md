# Dotfiles

This repo is based upon the Atlassian tutorial [The best way to store your dotfiles: A bare Git
repository](https://www.atlassian.com/git/tutorials/dotfiles).

It uses a bare git repo located in a `.dotfiles` directory within my `$HOME`. Any file within
`$HOME` can be tracked as required, but local git configuration is set to not display untracked
files (which would otherwise become unworkable). I intend to use this to help me keep my $HOME
directory in a more tidy fashion.

A shell alias `config` is used in place of the regular `git` command to mange this repo.

---

> [!NOTE]
>
> As of Sept 2025, configuration for Neovim has been moved to a separate repository at
> [https://git.curtishall.uk/surreymagpie/nvim](https://git.curtishall.uk/surreymagpie/nvim)
>

---

## Setup

To use these on a new machine:

``` bash
# Setup the alias temporarily - it will be available automatically in future shell sessions
alias config='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME /usr/bin/git'

# Download the repo
git clone --bare git@github.com:surreymagpie/config.git $HOME/.dotfiles

# Remove (or backup) existing files
rm .bashrc .gitconfig

# Write the config into the correct locations
config checkout main

# Hide untracked files
config config --local status.showUntrackedFiles no
```

## Usage

Any file which needs tracking, simply use the alias, instead of git directly,

e.g.:

``` bash
config add <path to file>
config commit
config push origin main
```

