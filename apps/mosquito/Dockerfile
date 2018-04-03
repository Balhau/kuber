FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="0.0.1"

RUN apk --no-cache add -U mosquitto && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

VOLUME ["/data"]

RUN mkdir config

ADD config /config/

RUN mkdir /opt

ADD start-mosquitto.sh /opt/

RUN chmod 777 /opt/start-mosquitto.sh

RUN chown -R mosquitto:mosquitto /config /data

RUN mkdir /data/log

ENTRYPOINT [ "/opt/start-mosquitto.sh" ]

# EXPOSE 1883 9001