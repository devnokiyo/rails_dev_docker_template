FROM mysql:5.7

COPY my.cnf /etc/mysql/conf.d
COPY grant_user.sql /docker-entrypoint-initdb.d
