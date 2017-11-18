[ -f /opt/ghost/install.lock ] && echo "Installation exists skipping setup" || /opt/installghost.sh
cd /opt/ghost; npm start
