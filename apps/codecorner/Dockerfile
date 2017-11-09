FROM arm32v6/alpine

MAINTAINER Balhau <balhau@balhau.net>

#Install git
RUN apk update && apk upgrade && \
    apk add --no-cache nodejs nodejs-npm sqlite-libs

RUN mkdir /opt
RUN npm i -g ghost-cli
RUN mkdir /opt/ghost
ADD scripts /opt/scripts
RUN chmod +x /opt/scripts/codecorner.sh; chmod +x /opt/scripts/installghost.sh

ENTRYPOINT  /opt/scripts/codecorner.sh
