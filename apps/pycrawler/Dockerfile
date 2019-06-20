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

ADD configs/config.yml /opt/pycrawl/config.yml

RUN chmod +x /opt/pycrawler.sh

ENTRYPOINT  /opt/pycrawler.sh