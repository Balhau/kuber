###################################
#Build stage
FROM golang:alpine AS build-env

ARG GOPROXY
ENV GOPROXY ${GOPROXY:-direct}

ARG GITEA_VERSION
ARG TAGS="sqlite sqlite_unlock_notify"
ENV TAGS "bindata $TAGS"

#Build deps
RUN apk update && apk upgrade && apk --no-cache add build-base git nodejs npm

RUN mkdir -p ${GOPATH}/src/code.gitea.io/; cd ${GOPATH}/src/code.gitea.io/; git clone https://github.com/go-gitea/gitea.git

#Setup repo
#COPY . ${GOPATH}/src/code.gitea.io/gitea
WORKDIR ${GOPATH}/src/code.gitea.io/gitea

#Checkout version if set
RUN if [ -n "${GITEA_VERSION}" ]; then git checkout "${GITEA_VERSION}"; fi \
 && make clean build

FROM alpine:latest
LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.10"

EXPOSE 22 3000

RUN apk update && apk upgrade && apk --no-cache add \
    bash \
    ca-certificates \
    curl \
    gettext \
    git \
    linux-pam \
    openssh \
    s6 \
    sqlite \
    su-exec \
    tzdata

RUN addgroup \
    -S -g 0 \
    git && \
  adduser \
    -S -H -D \
    -h /data/gitea \
    -s /bin/bash \
    -u 0 \
    -G git \
    git && \
  echo "git:$(dd if=/dev/urandom bs=24 count=1 status=none | base64)" | chpasswd

ENV USER git
ENV GITEA_CUSTOM /data/gitea

VOLUME ["/data"]

RUN apk add busybox-extras
RUN ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -q -N ""
RUN /usr/sbin/sshd -h /root/.ssh/id_rsa


COPY --from=build-env /go/src/code.gitea.io/gitea/gitea /app/gitea/gitea
RUN ln -s /app/gitea/gitea /usr/local/bin/gitea

ENTRYPOINT ["/app/gitea/gitea"]