FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.6"

RUN apk -U add curl git make gcc g++ linux-headers

RUN wget http://download.redis.io/redis-stable.tar.gz\
     && tar xvzf redis-stable.tar.gz\
     && cd redis-stable && make

# Add the files
ADD setup /

RUN chmod 777 /opt/start-redis

VOLUME /opt/redis/data

ENTRYPOINT [ "/opt/start-redis" ]