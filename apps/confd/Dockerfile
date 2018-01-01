FROM 10.108.252.69:5000/balhau/golang:arm32v6-0.0.1

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.1"

ARG CONFD_VERSION=0.14.0

ADD https://github.com/kelseyhightower/confd/archive/v${CONFD_VERSION}.tar.gz /tmp/

RUN mkdir -p /go/src/github.com/kelseyhightower/confd && \
  cd /go/src/github.com/kelseyhightower/confd && \
  tar --strip-components=1 -zxf /tmp/v${CONFD_VERSION}.tar.gz && \
  go install github.com/kelseyhightower/confd && \
  rm -rf /tmp/v${CONFD_VERSION}.tar.gz
