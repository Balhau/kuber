if [ -f /app/install.lock ] 
then
    echo "Installation exists skipping setup" 
else
    echo "Instataling gitlist blog on /app folder"
    cd /tmp && curl --silent --ssl https://s3.amazonaws.com/gitlist/gitlist-0.5.0.tar.gz | tar zxf -
    cp -R /tmp/gitlist/* /app/ && rm -rf /tmp/gitlist
    touch /app/install.lock
fi
