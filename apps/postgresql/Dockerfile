FROM arm32v6/alpine

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && \
    apk add curl "libpq@edge<9.7" "postgresql-client@edge<9.7" "postgresql@edge<9.7" "postgresql-contrib@edge<9.7" && \
    mkdir /docker-entrypoint-initdb.d && \
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.10/gosu-armhf" && \
    chmod +x /usr/local/bin/gosu && \
    apk del curl && \
    rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY init.d/ /docker-entrypoint-initdb.d/
COPY start-postgres.sh /
RUN chmod +x start-postgres.sh
RUN mkdir /run/postgresql/

ENTRYPOINT ["/start-postgres.sh"]

EXPOSE 5432
CMD ["postgres"]