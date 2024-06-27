#!/bin/bash

CONTAINER_REGISTRY="kakalin"
CONTAINER_REPOSITORY="xilinx"
CONTAINER_TAG="dnndk3.1-cuda10.0-tf1.2"

if [[ -e Dockerfile ]]; then
    # https://www.reddit.com/r/docker/comments/wqxqff/m1_docker_doesnt_find_shared_x64_shared_objects/
    docker build --platform linux/x86_64 --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
else
    cd $2
    docker build --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
fi