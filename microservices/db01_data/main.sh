#!/bin/bash

echo "+++++ INSTALLING GIT AND MARIA"
apt update
apt install git expect -y


echo "+++++ CONFIGURING DATABASE"
mysql -u root < /app/set_db_pass.sql

expect /app/mysql_secure_install.exp

mysql -u root -padmin123 < /app/accounts.sql

echo "+++++ CLONING REPO"
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql

systemctl restart mariadb