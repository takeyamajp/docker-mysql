FROM mysql  
MAINTAINER "Hiroki Takeyama"

ENV MYSQL_CHARSET utf8mb4  
ENV MYSQL_COLLATION utf8mb4_general_ci  
ENV MYSQL_ROOT_PASSWORD root

VOLUME /var/lib/mysql

EXPOSE 3306
