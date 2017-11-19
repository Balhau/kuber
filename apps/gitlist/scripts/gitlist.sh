[ -f /www/install.lock ] && echo "Installation exists skipping setup" || (echo "Instataling gitlist blog" && /opt/scripts/gitlist-install.sh)
echo "Initializing knex-migrator"
