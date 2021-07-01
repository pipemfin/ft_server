docker build . --tag example
docker run -p 80:80 -p 443:443 -it example