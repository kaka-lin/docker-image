#!/bin/bash

CONTAINER_REGISTRY="kakalin"
CONTAINER_REPOSITORY="kimage"
CONTAINER_TAG="cuda11.3-torch1.12.0-devel"

if [[ -e Dockerfile ]]; then
    docker build --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
else
    cd $2
    docker build --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
fi
