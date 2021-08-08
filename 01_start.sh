#! /bin/bash

VOLUME=$(ls -d $PWD/volume)
SUPERVISOR=$(ls -d $PWD/supervisor)
docker run -d -it -p 22:22 -p17000:17000 -p 80:80 -p 8080:8080 -p443:443 -i --mount type=bind,src=$VOLUME,dst=/tmp/volume --mount type=bind,src=$SUPERVISOR,dst=/tmp/supervisor bv/nginx_webserv
echo "Ip of the new container is: "
export CONTAINER=$(docker ps --filter "label=service=nginx" -q)
docker inspect -f "{{ .NetworkSettings.IPAddress }}" $(docker ps --filter "label=service=nginx" -q)
echo "Container ID is: " $CONTAINER
echo "Nginx log: "
sleep 2
docker exec -it $(docker ps --filter "label=service=nginx" -q) /bin/sh -c 'cat /tmp/nginx*'
