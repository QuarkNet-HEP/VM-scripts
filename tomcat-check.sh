#!/bin/bash
# /usr/bin/tomcat-check.sh 
# Create logfile as
#   $ sudo -u quarkcat touch ~quarkcat/tomcat-check.log
#   $ sudo chmod o-r ~quarkcat/tomcat-check.log 
# Cronjob in root's crontab ($ sudo crontab -e)
#   */15 * * * * /usr/bin/tomcat-check.sh
# (for every 15 minutes)

# Try a wget for Tomcat and ditch the output;
# we just want the exit code
wget -S --spider -q -t 5 localhost:8080 2>&1

# `$?` has the exit code of the last command
# `0` means the wget was good, everything else bad
CODE=$?
if [ $CODE -ne 0 ]; then
  # Get Tomcat version; e.g. 'tomcat9'
  # TODO: This will not work with multiple Tomcat versions.  Loop over all
  # versions present.	
  TOMVER=$(ls -1 /etc/ | egrep '^(tomcat[0-9]*)$')

  # For the moment, pick the version I want explicitly.
  # Restart the service
  #systemctl restart $TOMVER.service
  systemctl restart tomcat10.service
  
  # Log the code and restart
  printf "$(date)\t$CODE\n" >> /home/quarkcat/tomcat-check.log
fi
