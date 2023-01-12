#!/bin/bash

ROOT=$(pwd)
DOCKERIMAGE=""

for docker_file in $(find . -name 'Dockerfile'); do
    DOCKERIMAGE=${docker_file[@]:2:-11}
    echo "[Dockerfile] $DOCKERIMAGE"
done
