#! /bin/bash

ID=$(docker ps --filter "label=service=nginx" -q)

if [[ -nz "$ID" ]];
then
	docker kill $ID
fi
