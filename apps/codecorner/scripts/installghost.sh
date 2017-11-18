wget https://github.com/TryGhost/Ghost/releases/download/0.11.8/Ghost-0.11.8.zip --no-check-certificate
unzip -d /opt/ghost Ghost-0.11.8.zip
cd /opt/ghost
npm install --production
touch /opt/ghost/install.lock
