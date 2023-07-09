#!/bin/bash

docker build -t webserver .
docker run -d -p 80:80 webserver