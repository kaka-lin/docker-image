#!/bin/bash

CONTAINER_REGISTRY="kakalin"
CONTAINER_REPOSITORY="kimage"
CONTAINER_TAG="cuda11.6-tf2.9.1-devel"

if [[ -e Dockerfile ]]; then
    docker build --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
else
    cd $2
    docker build --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
fi
