FROM 10.108.252.69:5000/balhau/nodejs:v1

MAINTAINER Balhau <balhau@balhau.net>

RUN mkdir /opt
RUN cd /opt/
RUN git clone https://github.com/Balhau/kafka-intro.git


ADD scripts /opt/scripts
RUN chmod +x /opt/scripts/kafkaworkshop.sh; chmod +x /opt/scripts/kafkaworkshop.sh

ENTRYPOINT  /opt/scripts/kafkaworkshop.sh
