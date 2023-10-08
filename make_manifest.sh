#!/bin/bash

export USR=$DOCKER_NS
export TAG=$TRAVIS_TAG

docker manifest create $USR/of-watchdog:$TAG \
  $USR/of-watchdog:latest-dev-darwin \
  $USR/of-watchdog:latest-dev-x86_64 \
  $USR/of-watchdog:latest-dev-armhf \
  $USR/of-watchdog:latest-dev-arm64 \
  $USR/of-watchdog:latest-dev-windows

docker manifest annotate $USR/of-watchdog:$TAG --arch arm $USR/of-watchdog:latest-dev-darwin
docker manifest annotate $USR/of-watchdog:$TAG --arch arm $USR/of-watchdog:latest-dev-armhf
docker manifest annotate $USR/of-watchdog:$TAG --arch arm64 $USR/of-watchdog:latest-dev-arm64
docker manifest annotate $USR/of-watchdog:$TAG --os windows --arch amd64 $USR/of-watchdog:latest-dev-windows

docker manifest push $USR/of-watchdog:$TAG
