# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
eval "$($RBENV_ROOT/bin/rbenv init - --no-rehash bash)"
