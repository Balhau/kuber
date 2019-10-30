# Multistage balhauapi docker image
# Download and compile the rust source code
FROM armv7/armhf-java8

ENV WEBPT_HOME=/opt/webpt

RUN mkdir /opt/webpt
WORKDIR /opt/webpt
RUN cd /opt/webpt; wget http://shared.balhau.net/repo/snapshots/org/pt/pub/data/webpt-ws/1.0-SNAPSHOT/webpt-ws-1.0-20191030.145402-1.jar -O webpt-ws.jar

ENTRYPOINT [ "java", "-jar", "/opt/webpt/webpt-ws.jar" ]