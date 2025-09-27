#!/bin/bash

# To be run as root on a new Ubuntu database VM.
# One-liner to retrieve and implement this script:
# sudo curl -o apt-log-init.sh https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-log-files/apt-log-init.sh && sudo chmod 744 apt-log-init.sh && sudo bash -c 'source ./apt-log-init.sh' && sudo rm ./apt-log-init.sh && source /etc/bash.bashrc && source ~/.bashrc

# Download and place the apt-log scripts.
# Use `wget` if it's available, else `curl`.
if command -v wget >/dev/null 2>&1; then
    wget -O /usr/local/sbin/apt-log https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-log-files/apt-log
elif command -v curl >/dev/null 2>&1; then
    curl -o /usr/local/sbin/apt-log https://raw.githubusercontent.com/QuarkNet-HEP/VM-scripts/refs/heads/main/apt-log-files/apt-log
else
    echo "Neither 'wget' nor 'curl' were found on the system.  Exiting."
    exit 1
fi

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
