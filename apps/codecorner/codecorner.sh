[ -f /opt/ghost/install.lock ] && echo "Installation exists skipping setup" || (echo "Instataling ghost blog" && /opt/installghost.sh)
cd /opt/ghost; npm start
