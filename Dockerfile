FROM mysql
MAINTAINER "Hiroki Takeyama"

# timezone
ENV TZ Asia/Tokyo

# mysql charset
RUN { \
    echo '[mysqld]'; \
    echo 'init-connect = SET NAMES utf8'; \
    echo 'collation-server = utf8_unicode_ci'; \
    echo 'character-set-server = utf8'; \
    echo 'skip-character-set-client-handshake'; \
    echo 'default_password_lifetime = 0'; \
} > /etc/mysql/conf.d/charset.cnf

# mysql password
ENV MYSQL_ROOT_PASSWORD root

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mysqld"]
