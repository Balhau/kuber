FROM 10.108.252.69:5000/balhau/php:armv6-0.0.7

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="1.0.0"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apk update && \
	apk upgrade && \
    apk add --update curl && \
    apk add --no-cache bash git openssh

RUN mkdir /git

ADD scripts /opt/scripts/pre-exec.d
RUN chmod +x /opt/scripts/pre-exec.d/gitlist.sh

# Set Workdir
WORKDIR /app

# Expose volumes
VOLUME ["/app"]

VOLUME ["/git"]

# Expose ports
EXPOSE 80

# Entry point
#CMD ["/usr/bin/php", "-a"]

ENTRYPOINT /opt/scripts/run.sh