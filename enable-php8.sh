#ENABLE PHP8.0 IN AMAZON LINUX

#INSTALL APACHE AND PHP 
sudo yum update -y
sudo amazon-linux-extras enable php8.0
yum clean metadata
sudo yum install httpd mod_ssl -y
sudo yum install php php-cli php-mysqlnd php-pdo php-common php-cli php-pdo php-fpm php-json php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum-config-manager --enable epel

#INSTALL DATABASE
sudo yum install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation

sudo mysql -u root -p
create user 'wp_user'@localhost identified by 'XXXXX';
create database wp;
grant all privileges on wp.* to 'wp_user'@localhost;

#INSTALL WORDPRESS
cd /tmp
wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo rm -rf /var/www/html/
sudo mv wordpress/ /var/www/html/

#CHANGE PERMISSIONS TO INSTALL/REMOVE PLUGINS
sudo chmod -R 755 /var/www/html
sudo chown -R apache:root /var/www/html
