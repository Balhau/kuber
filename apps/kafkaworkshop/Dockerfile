#FROM 10.108.252.69:5000/balhau/nodejs:v1
FROM  resin/raspberry-pi-alpine-node

MAINTAINER Balhau <balhau@balhau.net>

#RUN mkdir /opt
RUN echo "CENAS"
RUN cd /opt/
RUN apk update && apk upgrade && apk add git
#RUN apt-get update; apt-get upgrade; apt-get install git
RUN cd /opt;git clone https://github.com/Balhau/kafka-intro.git

#WORKDIR /opt/kafka-intro

RUN npm install -g grunt-cli
#RUN npm update; npm install 
RUN cd /opt/kafka-intro/ && npm install


ADD scripts /opt/scripts
RUN chmod +x /opt/scripts/kafkaworkshop.sh; chmod +x /opt/scripts/kafkaworkshop.sh

ENTRYPOINT  /opt/scripts/kafkaworkshop.sh
