#!/bin/bash

ROOT=$(pwd)
FOLDER_NAME=""
MACHINE=""

if [[ -z $1 ]]; then
    MACHINE="localhost"
else
    MACHINE=$1
fi

for docker_build in $(find . -name 'build*'); do
    FOLDER_NAME=${docker_build[@]:2:-9}
    echo ">>> Start build $FOLDER_NAME"
    $docker_build $MACHINE $FOLDER_NAME
done
