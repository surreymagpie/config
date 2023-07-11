
# A new home for my dotfiles

This repo is based upon the Atlassian tutorial [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles). This, in turn is based on a Hacker News thread [here](https://news.ycombinator.com/item?id=11070797).

It uses a bare git repo located in a `.dotfiles` directory within my `$HOME`. Any file within `$HOME` can be tracked as required, but local git configuration is set to not display untracked files (which would otherwise become unworkable). I intend to use this to help me keep my $HOME directory in a more tidy fashion.

I have setup configurations for vim and git so that these are stored within `$XDG_CONFIG_HOME`. This takes more work to setup but should only need doing once. The `$HOME/.gitconfig` **must** be removed if it already exists as it would be read first and the `$XDG_CONFIG_HOME/git/config` file would be ignored.

A shell alias `config` is used in place of the regular `git` command to mange this repo. 

To use these on a new machine:

```bash
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

Any file which needs tracking, simply use the alias, instead of git directly, e.g.:

```bash
config add <path to file>
config commit -m 'Add <file>'
config push origin main
```
