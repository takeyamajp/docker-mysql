FROM mysql  
MAINTAINER "Hiroki Takeyama"

ENV MYSQL_CHARSET utf8mb4
ENV MYSQL_ROOT_PASSWORD root

VOLUME /var/lib/mysql

EXPOSE 3306
