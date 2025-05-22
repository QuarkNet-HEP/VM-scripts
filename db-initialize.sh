#!/bin/bash

# To be run as root on a new Ubuntu database VM.

### Apt-log ###
# Place the apt-log scripts
curl -o /usr/local/sbin/apt-get-log https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-get-log

curl -o /usr/local/sbin/apt-log https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-log

chown root:root /usr/local/sbin/{apt-log,apt-get-log}
chmod 744 /usr/local/sbin/{apt-log,apt-get-log}

# Alias the apt-log scripts to apt/apt-get system-wide
cat <<EOF >> /etc/bash.bashrc

# Added $(date)
# The extra space in the following prompts Bash to check the next value for
# alias expansion, thus allowing aliases to be passed through to 'sudo':
alias sudo='sudo '
alias apt-get='/usr/local/sbin/apt-get-log'
alias apt='/usr/local/sbin/apt-log'
EOF


### Prepare for installations
apt update

### Postgres ###
# Install Postgres
apt install postgres

### MySQL ###
# Install MySQL
apt install mysql-server
