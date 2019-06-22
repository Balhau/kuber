FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.4"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh python python-dev py2-pip build-base 

ADD scripts/start-python-server.sh /opt/start-server.sh

RUN chmod +x /opt/start-server.sh

ENTRYPOINT  /opt/start-server.sh
