FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && \
apt-get install mariadb-server mariadb-client -y && \
apt-get install curl -y && apt-get install wget -y && \
apt-get install php php-fpm php-common php-mysql php-gd php-soap php-xml -y
COPY srcs/server_start.sh ./
COPY srcs/config.inc.php ./
COPY srcs/autoindex.sh ./
COPY srcs/phpmyadmin.conf ./
COPY srcs/wp-config.php ./
COPY srcs/localhost.conf ./etc/nginx/sites-available/
EXPOSE 80 443
CMD bash server_start.sh