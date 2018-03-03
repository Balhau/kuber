FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.1"

# Add the files
ADD setup /

#Install redis
#RUN echo "http://dl-4.alpinelinux.org/alpine/v3.1/main" >> /etc/apk/repositories && \
#    apk add --update redis=2.8.23-r0 && \
#    rm -rf /var/cache/apk/* && \
#    mkdir /data && \
#    chown -R redis:redis /data && \
#    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

RUN apk -U add curl git make gcc g++

RUN wget http://download.redis.io/redis-stable.tar.gz\
     && tar xvzf redis-stable.tar.gz\
     && cd redis-stable && make



VOLUME /opt/redis/data