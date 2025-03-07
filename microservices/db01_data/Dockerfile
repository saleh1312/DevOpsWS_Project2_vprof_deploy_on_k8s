FROM mysql
ENV MYSQL_ROOT_PASSWORD="admin123"
ENV MYSQL_DATABASE="accounts"
COPY db_backup.sql docker-entrypoint-initdb.d/db_backup.sql