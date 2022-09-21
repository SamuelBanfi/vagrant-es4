#!/bin/bash
echo "PHP provisioning - begin"
sudo apt-get install php -y #install php
sudo apt-get install php-mysql -y #install mysql plugin for php
sudo systemctl restart apache2
echo "PHP provisioning - end"