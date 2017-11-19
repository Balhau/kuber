cd /tmp && curl --silent --ssl https://s3.amazonaws.com/gitlist/gitlist-0.5.0.tar.gz | tar zxf -
cp -R /tmp/gitlist/* /www/ && rm -rf /tmp/gitlist
touch /www/install.lock