FROM arm32v6/alpine

MAINTAINER Balhau <balhau@balhau.net>

#Install git
RUN apk update && apk upgrade && \
    apk add --no-cache nodejs uwsgi uwsgi-python py2-pip nodejs-npm ca-certificates unzip wget openssl sqlite-libs\
    && pip2 install --upgrade pip\
    && pip2 install sqlalchemy

RUN  update-ca-certificates

RUN mkdir /opt

RUN cd /opt/ && mkdir ghost &&\
    wget https://ghost.org/zip/ghost-latest.zip --no-check-certificate &&\
    unzip -d /opt/ghost ghost-latest.zip

ADD scripts /opt/scripts
RUN chmod +x /opt/scripts/codecorner.sh; chmod +x /opt/scripts/installghost.sh

ENTRYPOINT  /opt/scripts/codecorner.sh
