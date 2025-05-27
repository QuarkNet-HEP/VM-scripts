#!/bin/bash                                                                   

# Get the mod_php name, which varies by version.                              
apache_mods='/etc/apache2/mods-available/'
php_name=$(find $apache_mods -type f -name "php*.load" | xargs -n 1 basename)
php_mod_name=${php_name%'.load'}

# Enable mods the e-Labs require                                              
sudo a2enmod $php_mod_name
sudo a2enmod proxy
sudo a2enmod proxy_ajp
sudo a2enmod ssl
sudo a2enmod rewrite
sudo a2enmod headers

# Disable the default site                                                    
sudo a2dissite 000-default.conf

# Enable the e-Labs                                                           
sudo a2ensite elabs.conf
