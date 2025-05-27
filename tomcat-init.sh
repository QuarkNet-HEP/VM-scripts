#!/bin/bash

# The current tomcat version
TOMCAT='tomcat10'

## Give tomcat group ownership of the webapp ROOT/ directory
sudo chown :tomcat /var/lib/$TOMCAT/webapps/ROOT
sudo chmod 775 /var/lib/$TOMCAT/webapps/ROOT

## Move the default index file
sudo mv /var/lib/$TOMCAT/webapps/ROOT/index.html /var/lib/$TOMCAT/webapps/ROOT/index-tomcat.default.html

## Give quarkcat permission to restart Tomcat
sudo touch /etc/sudoers.d/quarkcat

cat <<EOF >/etc/sudoers.d/quarkcat
Cmnd_Alias TOMCAT = /bin/systemctl restart $TOMCAT.service

quarkcat ALL = (root) NOPASSWD: TOMCAT
EOF
