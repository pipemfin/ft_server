# setup nginx
chown -R www-data:www-data /var/log/nginx;
chmod -R 755 /var/log/nginx;
ln -s /etc/nginx/sites-available/localhost.conf /etc/nginx/sites-enabled/

# get ssl sertificates
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=RU/ST=Tatarstan/L=Kzn/O=School21/OU=Student/CN=Jjerrod"

# install phpmyadmin
mkdir -p /var/lib/phpmyadmin/tmp
mkdir -p /usr/share/phpmyadmin/tmp
chown -R www-data:www-data /usr/share/phpmyadmin/tmp;
chown -R www-data:www-data /var/lib/phpmyadmin
cd /usr/share/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components 1
rm phpMyAdmin-5.0.4-all-languages.tar.gz
mv ~/../config.inc.php ~/../usr/share/phpmyadmin

# setup mysql database
service mysql start
mysql -e "create database wordpress; grant all on phpmyadmin.* to 'root'@'localhost'; set password for 'root'@'localhost' = password('');"
mysql -u root < sql/create_tables.sql
cd /..
mkdir /etc/nginx/templates
mv phpmyadmin.conf /etc/nginx/templates/
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# install wordpress
mkdir /var/www/wordpress
mkdir /var/www/wordpress/test
cd /var/www/wordpress
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz --strip-components 1
rm latest.tar.gz
chown -R www-data:www-data /var/www/wordpress
mv ~/../wp-config.php /var/www/wordpress

# starting
service nginx start
service php7.3-fpm start
bash
