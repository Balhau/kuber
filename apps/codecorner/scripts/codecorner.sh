[ -f /opt/ghost/install.lock ] && echo "Installation exists skipping setup" || /opt/scripts/installghost.sh
cd /opt/ghost; npm start
