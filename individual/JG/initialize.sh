#!/bin/bash

user=$SUDO_USER

# Create the `~/.bash_aliases` file
touch /home/$user/.bash_aliases

# Add the `ls` alias
cat << EOF >> /home/$user/.bash_aliases
alias ls='ls -Alh'
EOF

# Activate the alias
source /home/$user/.bash_aliases
