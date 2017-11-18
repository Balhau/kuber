[ -f /opt/ghost/install.lock ] && echo "Installation exists skipping setup" || (echo "Instataling ghost blog" && /opt/scripts/installghost.sh)
echo "Initializing knex-migrator"
cd /opt/ghost && knex-migrator init --mgpath /opt/ghost/MigratorConfig.js
cd /opt/ghost && npm start
