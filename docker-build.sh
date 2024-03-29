#!/bin/bash

ROOT=$(pwd)
FOLDER_NAME=""
MACHINE=""
DOCKEEFILE_ARRAY=""

if [[ -z $1 ]]; then
    MACHINE="localhost"
else
    MACHINE=$1
fi

# Find the Base Dockerfile first
#echo ">>> Base Dockerfile: ${DOCKEEFILE_ARRAY[0]}"
for base_docker in $(find . -name 'cuda*'); do
    if [[ -n $(find $base_docker -name 'Dockerfile') && 
          -n $(find $base_docker -name 'build*') ]]; then
        BASE_DOCKERFILE=${base_docker[@]:2}
        DOCKEEFILE_ARRAY+=("$BASE_DOCKERFILE")
        echo ">>> Base Dockerfile: $BASE_DOCKERFILE"
    fi
done

# Append the rest Dockerfile
for docker_file in $(find . -name 'build*'); do
    DOCKERFILE=${docker_file[@]:2:-9}
    if [[ "${DOCKEEFILE_ARRAY[*]}" != *"$DOCKERFILE"* ]]; then
        DOCKEEFILE_ARRAY+=("$DOCKERFILE")
        echo ">>> Dockerfile: $DOCKERFILE"
    fi
done

# Starting docker build
for docker_folder in "${DOCKEEFILE_ARRAY[@]}"; do
    FOLDER_NAME=$docker_folder
    DOCKER_BUILD="$docker_folder/build.sh"
    echo ">>> Start build $FOLDER_NAME"
    $DOCKER_BUILD $MACHINE $FOLDER_NAME
done
