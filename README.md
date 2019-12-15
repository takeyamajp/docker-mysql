# mysql
[![Docker Stars](https://img.shields.io/docker/stars/takeyamajp/mysql.svg)](https://hub.docker.com/r/takeyamajp/mysql/)
[![Docker Pulls](https://img.shields.io/docker/pulls/takeyamajp/mysql.svg)](https://hub.docker.com/r/takeyamajp/mysql/)
[![license](https://img.shields.io/github/license/takeyamajp/docker-mysql.svg)](https://github.com/takeyamajp/docker-mysql/blob/master/LICENSE)

    FROM mysql:8  
    MAINTAINER "Hiroki Takeyama"
    
    ENV TZ Asia/Tokyo
    
    ENV MYSQL_CHARSET utf8mb4  
    ENV MYSQL_COLLATION utf8mb4_general_ci
    
    ENV MYSQL_ROOT_PASSWORD root  
    ENV MYSQL_DATABASE db  
    ENV MYSQL_USER user  
    ENV MYSQL_PASSWORD user
    
    VOLUME /var/lib/mysql
    
    EXPOSE 3306
