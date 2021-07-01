# ft_server

![Docker](https://www.docker.com/sites/default/files/social/docker_facebook_share.png)

## Describe 

This study project introduce me to system administration. It make me aware of the importance of using scripts to automate tasks, discover the "docker" technology and use it to install a complete web server. This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

Features of the my project:

    + Web server with Nginx, in only one docker container. The container OS - debian buster.

    + Web server run several services at the same time: WordPress website, phpMyAdmin and MySQL.

    + Server use the SSL protocol.

    + Depending on the url, server redirects to the correct website.

    + Server is running with an autoindex that can be disabled with script autoindex.sh.

## How to run

Just run start.sh (before this you need to install Docker).
