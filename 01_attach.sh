#! /bin/bash

docker exec -it $(docker ps --filter "label=service=nginx" -q) /bin/zsh
