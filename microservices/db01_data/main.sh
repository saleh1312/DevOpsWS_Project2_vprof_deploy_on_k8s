#!/bin/bash

yum install epel-release -y
yum install git mariadb-server expect -y


systemctl start mariadb
systemctl enable mariadb

mysql -u root < /app/set_db_pass.sql

expect /app/mysql_secure_install.exp

mysql -u root -padmin123 < /app/accounts.sql

git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql

systemctl restart mariadb