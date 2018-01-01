FROM arm32v7/debian

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v7/armhf" version="0.0.1"

ARG GO_VERSION=1.9.2
ARG CONFD_VERSION=0.14.0
ENV PATH=$PATH:/opt/go/bin

ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-armv6l.tar.gz /opt/

RUN cd /opt && tar -C /opt -xzf go${GO_VERSION}.linux-armv6l.tar.gz


ADD https://github.com/kelseyhightower/confd/archive/v${CONFD_VERSION}.tar.gz /tmp/

RUN mkdir -p /opt/go/src/github.com/kelseyhightower/confd && \
  cd /opt/go/src/github.com/kelseyhightower/confd && \
  tar --strip-components=1 -zxf /tmp/v${CONFD_VERSION}.tar.gz && \
  go install github.com/kelseyhightower/confd && \
  rm -rf /tmp/v${CONFD_VERSION}.tar.gz

  