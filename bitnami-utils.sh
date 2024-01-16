#IN CASE YOU ARE USING BITNAMI TO HOST WORDPRESS AND NEED TO CHANGE PRIVILEGES TO INSTALL/DELETE PLUGINS

sudo chown -R bitnami:daemon /opt/bitnami/wordpress
sudo find /opt/bitnami/wordpress -type d -exec chmod 775 {} \;
sudo find /opt/bitnami/wordpress -type f -exec chmod 664 {} \;
sudo chown -R bitnami:daemon /bitnami/wordpress
sudo find /bitnami/wordpress -type d -exec chmod 775 {} \;
sudo find /bitnami/wordpress -type f -exec chmod 664 {} \;
sudo chmod 640 /bitnami/wordpress/wp-config.php

#IN CASE YOU NEED TO INSTALL TLS CERTIFICATE
sudo /opt/bitnami/bncert-tool
