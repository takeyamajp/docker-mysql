FROM mysql
MAINTAINER "Hiroki Takeyama"

# timezone
ENV TZ Asia/Tokyo

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
    echo 'docker-entrypoint.sh "$@"'; \
    } > /usr/local/bin/entrypoint.sh; \
    chmod +x /usr/local/bin/entrypoint.sh;
ENTRYPOINT ["entrypoint.sh"]

# mysql character-code
ENV MYSQL_CHARSET utf8mb4
ENV MYSQL_COLLATION utf8mb4_general_ci

# mysql database conditions
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE db
ENV MYSQL_USER user
ENV MYSQL_PASSWORD user

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mysqld"]
