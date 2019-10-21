#!/bin/bash

DOCKER_NAME='darknet-docker'

if [ "$1" == 'build' ];
then
    printf "Espere, this operation maybe take a few years\n"
    docker build -t $DOCKER_NAME .
    exit 0
fi


if [ "$1" == "alias" ];
then
    echo "alias bash-${DOCKER_NAME}='sudo docker run -v \$PWD:/home/anybody --expose=8899 -p 8899:8899 -w /home -it ${DOCKER_NAME} /bin/bash'"
fi


if [ "$1" == 'ipython' ];
then
    sudo docker run -v $PWD:/home/anybody --expose=8899 -p 8899:8899 -w /home --entrypoint ipython3 $DOCKER_NAME
    exit 0
fi


sudo docker run -v $PWD:/home/anybody --expose=8899 -p 8899:8899 -w /home --entrypoint jupyter-notebook $DOCKER_NAME --ip 0.0.0.0 --port 8899 --allow-root
