FROM mysql:8
MAINTAINER "Hiroki Takeyama"

# mysql
RUN mkdir /mysql; \
    sed -i 's/^\(datadir\)\s*=.*/\1 = \/mysql/' /etc/my.cnf;

# entrypoint
RUN { \
    echo '#!/bin/bash -eu'; \
    echo '{'; \
    echo 'echo "[client]"'; \
    echo 'echo "default-character-set = ${MYSQL_CHARSET}"'; \
    echo 'echo "[mysqld]"'; \
    echo 'echo "init-connect = SET NAMES ${MYSQL_CHARSET}"'; \
    echo 'echo "character-set-server = ${MYSQL_CHARSET}"'; \
    echo 'echo "collation-server = ${MYSQL_COLLATION}"'; \
    echo 'echo "skip-character-set-client-handshake"'; \
    echo 'echo "default_password_lifetime = 0"'; \
    echo 'echo "default_authentication_plugin = mysql_native_password"'; \
    echo '} > /etc/mysql/conf.d/charcode.cnf'; \
    echo 'chown -R mysql:mysql /mysql'; \
    echo 'exec "$@"'; \
    } > /usr/local/bin/entrypoint.sh; \
    chmod +x /usr/local/bin/entrypoint.sh;

# timezone
ENV TZ Asia/Tokyo

# character-set
ENV MYSQL_CHARSET utf8mb4
ENV MYSQL_COLLATION utf8mb4_general_ci

# database conditions
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_DATABASE db
ENV MYSQL_USER user
ENV MYSQL_PASSWORD password

VOLUME /mysql

EXPOSE 3306

# X Protocol
EXPOSE 33060

ENTRYPOINT ["entrypoint.sh"]
CMD ["docker-entrypoint.sh", "mysqld"]
