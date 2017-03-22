#!/bin/bash

docker rm -f `docker ps | grep neurodata/sic | awk '{ print $1 }'`
docker run -d -p 80:8888 neurodata/sic:paper
