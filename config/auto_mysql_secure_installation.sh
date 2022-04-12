#!/bin/bash
# Start services
sudo systemctl start mariadb
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE IF EXISTS test"
# Create dvwa database
mysql -e "CREATE DATABASE IF NOT EXISTS dvwa"
# Create user dvwa
mysql -e "CREATE USER dvwa@localhost identified by 'p@ssw0rd'"
# Grant access right to dvwa user on dvwa database
mysql -e "GRANT ALL ON dvwa.* TO dvwa@localhost"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
# Restart service
sudo systemctl restart mariadb