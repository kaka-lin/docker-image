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
          -n $(find $base_docker -name 'deploy*') ]]; then
        BASE_DOCKERFILE=${base_docker[@]:2}
        DOCKEEFILE_ARRAY+=("$BASE_DOCKERFILE")
        echo ">>> Base Dockerfile: $BASE_DOCKERFILE"
    fi
done

# Append the rest Dockerfile
for docker_file in $(find . -name 'deploy*'); do
    DOCKERFILE=${docker_file[@]:2:-10}
    if [[ "${DOCKEEFILE_ARRAY[*]}" != *"$DOCKERFILE"* ]]; then
        DOCKEEFILE_ARRAY+=("$DOCKERFILE")
        echo ">>> Dockerfile: $DOCKERFILE"
    fi
done

# Starting docker push
for docker_folder in "${DOCKEEFILE_ARRAY[@]}"; do
    FOLDER_NAME=$docker_folder
    DOCKER_DEPLOY="$docker_folder/deploy.sh"
    echo ">>> Start push $FOLDER_NAME"
    $DOCKER_DEPLOY $MACHINE $FOLDER_NAME
done
