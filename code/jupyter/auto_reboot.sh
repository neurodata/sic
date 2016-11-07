#!/bin/bash

docker rm -f `docker ps | grep sic:ndmg | awk '{ print $1 }'`
docker run -d -p 80:8888 sic:ndmg
echo "oh hey man"
