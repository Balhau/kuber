FROM 10.108.252.69:5000/balhau/php:armv6-0.0.1

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="1.0.0"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apk update && \
	apk upgrade && \
    apk add --update curl


ADD scripts /opt/scripts

# Set Workdir
WORKDIR /www

# Expose volumes
VOLUME ["/www"]

# Expose ports
EXPOSE 9000

# Entry point
#CMD ["/usr/bin/php", "-a"]

ENTRYPOINT /opt/scripts/gitlist.sh