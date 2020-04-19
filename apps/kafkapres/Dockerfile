#FROM 10.108.252.69:5000/balhau/nodejs:v1

FROM 192.168.1.15:5000/balhau/nodejs:v1

MAINTAINER Balhau <balhau@balhau.net>

RUN apk update && apk upgrade && \
    apk add --no-cache uwsgi uwsgi-python py2-pip ca-certificates unzip wget openssl sqlite-libs\
    && apk add --no-cache gcc make libc-dev python g++\
    && npm install -g node-pre-gyp

RUN  update-ca-certificates

RUN npm install -g sqlite3
RUN npm install -g knex-migrator
RUN mkdir /opt
RUN cd /opt/ && mkdir ghost


ENTRYPOINT  /opt/scripts/codecorner.sh
