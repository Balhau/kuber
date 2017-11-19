FROM arm32v6/alpine

LABEL maintainer "Balhau <balhau@balhau.net>" architecture="ARM32v6/armhf" version="1.0.0"

# Maintainer
MAINTAINER Balhau <balhau@balhau.net>

RUN apk --update add  php5-apache2 curl php5-cli php5-json php5-phar php5-openssl && rm -f /var/cache/apk/* && \
curl -sS https://getcomposer.org/installer | php5 -- --install-dir=/usr/local/bin --filename=composer && \
mkdir /app && chown -R apache:apache /app && \
sed -i 's#^DocumentRoot ".*#DocumentRoot "/app"#g' /etc/apache2/httpd.conf && \
sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
echo "Success"

RUN mkdir /opt
ADD scripts /opt/scripts
RUN mkdir /opt/scripts/pre-exec.d && \
mkdir /opt/scripts/pre-init.d && \
chmod -R 755 /opt/scripts

EXPOSE 80

# Set Workdir
WORKDIR /app

# Expose volumes
VOLUME ["/app"]

# Entry point
ENTRYPOINT "/opt/scripts/run.sh"