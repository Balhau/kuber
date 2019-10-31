FROM armv7/armhf-java8

ENV WEBPT_HOME=/opt/webpt
ENV WEB_PT_VERSION=1.0-20191030.210447-5

#Add certificates to java env
ADD cacerts /usr/lib/jvm/java-8-oracle/jre/lib/security/

RUN mkdir /opt/webpt
WORKDIR /opt/webpt
#Download the java fat jar
RUN cd /opt/webpt; wget http://shared.balhau.net/repo/snapshots/org/pt/pub/data/webpt-ws/1.0-SNAPSHOT/webpt-ws-${WEB_PT_VERSION}.jar -O webpt-ws.jar

ENTRYPOINT [ "java", "-jar", "/opt/webpt/webpt-ws.jar" ]