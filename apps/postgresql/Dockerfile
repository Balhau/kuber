# vim:set ft=dockerfile:
FROM quay.io/armswarm/alpine:3.7

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.4"

ARG PG_PACKAGE
ARG PG_VERSION
ARG PG_MAJOR

ENV LANG=en_US.utf8 \
    PG_VERSION=$PG_VERSION \
    PG_MAJOR=$PG_MAJOR \
    PGDATA=/var/lib/postgresql/data

COPY docker-entrypoint.sh /usr/local/bin

RUN \
  mkdir /docker-entrypoint-initdb.d \
  && apk add --no-cache --upgrade \
        ca-certificates \
        bash \
        su-exec \
        postgresql=${PG_PACKAGE} \
        postgresql-contrib=${PG_PACKAGE} \
        tzdata \
  && sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /usr/share/postgresql/postgresql.conf.sample \
  && mkdir -p /var/run/postgresql \
  && chown -R postgres:postgres /var/run/postgresql \
  && chmod 2777 /var/run/postgresql \
  && mkdir -p "$PGDATA" \
  && chown -R postgres:postgres "$PGDATA" \
  # this 777 will be replaced by 700 at runtime (allows semi-arbitrary "--user" values)
  && chmod 777 "$PGDATA"

VOLUME $${PGDATA}

EXPOSE 5432

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

CMD [ "postgres" ]