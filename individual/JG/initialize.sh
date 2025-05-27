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

# Activate the alias only if it's needed for the current script.
# This has no effect on the calling shell, and aliases aren't expanded in scripts.
#source /home/$user/.bash_aliases

# Make Emacs the editor for `sudoedit` and fix journalctl's junk
cat << EOF >> /home/$user/.profile

# Added $(date) - JG
# Set the sudo editor to Emacs
# https://old.reddit.com/r/linux/comments/osah05/ysk_do_not_use_sudo_vimnanoema\
cs_to_edit_a_file/
export EDITOR=/usr/bin/emacs

# This makes journalctl wrap long lines
# See https://serverfault.com/a/1067315 for explanation
export SYSTEMD_LESS="FRXMK"

EOF
