FROM arm32v6/alpine

MAINTAINER Balhau <balhau@balhau.net>

#Install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN apk add --no-cache bash git nginx uwsgi uwsgi-python py2-pip \
	&& pip2 install --upgrade pip \
	&& pip2 install flask\
    && pip2 install google-api-python-client\
    && pip2 install pika\
    && pip2 install sqlalchemy\
    && pip2 install kazoo

RUN pip2 install pyyaml

RUN pip2 install kafka-python

RUN mkdir /opt/; cd /opt/; git clone https://github.com/Balhau/pycrawl.git;

ADD pycrawler.sh /opt/pycrawler.sh

RUN chmod +x /opt/pycrawler.sh

ENTRYPOINT  /opt/pycrawler.sh


#Get source code
#RUN wget -q -O /opt/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz \
#      http://mirrors.fe.up.pt/pub/apache/kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz \
#      && tar -xzf /opt/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
#      && rm -rf /opt/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz

#Zookeeper
#RUN wget -q -O /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
#      http://mirrors.fe.up.pt/pub/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
#      && tar -xzf /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt \
#      && rm -rf /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz

#ADD start-kafka.sh /opt/
#RUN chmod +x /opt/start-kafka.sh

#ENTRYPOINT /opt/start-kafka.sh