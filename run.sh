#!/bin/bash

if [[ "$(docker ps -a | grep 'wolfetti-radicale-dev')" != "" ]]; then
  docker stop wolfetti-radicale-dev
  docker rm wolfetti-radicale-dev
fi

docker volume create wolfetti-radicale-dev_data
docker volume create wolfetti-radicale-dev_conf

docker run -d --name wolfetti-radicale-dev \
  -p 35232:5232 \
  -v wolfetti-radicale-dev_data:/data \
  -v wolfetti-radicale-dev_conf:/conf \
  wolfetti/radicale
