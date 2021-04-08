if [[ -e Dockerfile ]]; then
    docker build --rm -t kakalin/kimage:cuda11.1-torch1.8-devel .
else
    cd $2
    docker build --rm -t kakalin/kimage:cuda11.1-torch1.8-devel .
fi
