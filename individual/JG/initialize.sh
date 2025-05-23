#!/bin/bash

# $ curl -o initialize.sh https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/individual/JG/initialize.sh
# $ sudo chmod 744 initialize.sh
# $ ./initialize.sh && source ~/.bash_aliases

# For the time being, this doesn't need 'sudo'.
#user=$SUDO_USER
user=$USER

# Create the `~/.bash_aliases` file
touch /home/$user/.bash_aliases

# Add the `ls` alias
cat << EOF >> /home/$user/.bash_aliases
alias ls='ls -Alh'
EOF

# Activate the alias
source /home/$user/.bash_aliases
