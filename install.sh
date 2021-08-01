#!/bin/bash
if [ "$#" -gt 0 ]; then
  export IMAGE_TAG="$1"
  echo "Getting the Docker Socket GIU"
  DOCKER_HOST_GIU=$(stat /var/run/docker.sock | awk '{print $9}' | sed -E '/^$/d' | tr -d '/')
  sed -i "s/DOCKER_SOCK_GID=117/DOCKER_SOCK_GID=$DOCKER_HOST_GIU/g" Dockerfile
  docker build . -t $IMAGE_TAG
else
  echo "ERROR: You must specify an argument to be passed to the shell script (Image Tag)"
fi