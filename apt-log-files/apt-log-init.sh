#!/bin/bash

# To be run as root on a new Ubuntu database VM.
# $ curl -o apt-log-init.sh https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-log-files/apt-log-init.sh
# $ sudo chmod 744 apt-log-init.sh
# $ sudo ./apt-log-init.sh

# Download and place the apt-log scripts
curl -o /usr/local/sbin/apt-log https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-log-files/apt-log

chown root:root /usr/local/sbin/apt-log
chmod 744 /usr/local/sbin/apt-log

# Alias the apt-log scripts to apt/apt-get system-wide
cat <<EOF >> /etc/bash.bashrc

# Added $(date)
# The extra space in the following prompts Bash to check the next value for
# alias expansion, thus allowing aliases to be passed through to 'sudo':
alias sudo='sudo '
alias apt='/usr/local/sbin/apt-log'
alias apt-get='/usr/local/sbin/apt-log'
EOF

# Use `source` to activate the aliases
source /etc/bash.bashrc

# On Ubuntu 24.04, the above removes color from the prompt.
# Restore it by re-sourcing the user's `.bashrc`, which sets the color.
source /home/$SUDO_USER/.bashrc
