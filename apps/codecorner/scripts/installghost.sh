wget https://ghost.org/zip/ghost-latest.zip --no-check-certificate
unzip -d /opt/ghost ghost-latest.zip
cd /opt/ghost
npm install --production
touch /opt/ghost/install.lock
