#!/bin/bash

DOCKER_NAME='python3.8-alpine'

if [ "$1" == 'build' ];
then
    printf "Espere, this operation maybe take a few years\n"
    docker build -t $DOCKER_NAME .
    exit 0
fi

if [ "$1" == 'alias' ];
then
    echo "alias jupyter-${DOCKER_NAME}='sudo docker run -v \$PWD:/home/work --expose=8899 -p 8899:8899 -w /home/work --entrypoint jupyter-notebook ${DOCKER_NAME} --ip 0.0.0.0 --port 8899 --allow-root'" >> ~/.bash_aliases
    echo "alias ipython3-${DOCKER_NAME}='sudo docker run -v \$PWD:/home/work --expose=8899 -p 8899:8899 -w /home/work -it ${DOCKER_NAME} ipython3'"
    echo "alias bash-${DOCKER_NAME}='sudo docker run -v \$PWD:/home/work --expose=8899 -p 8899:8899 -w /home/work -it ${DOCKER_NAME} /bin/bash'"
    exit 0
fi



if [ "$1" == "bash" ];
then

    sudo docker run -v $PWD:/home/work --expose=8899 -p 8899:8899 -w /home/work -it --entrypoint /bin/bash $DOCKER_NAME
    exit 0

elif [ "$1" == 'ipython' ];
then

	sudo docker run -v $PWD:/home/work --expose=8899 -p 8899:8899 -w /home/work -it ${DOCKER_NAME} ipython3
    exit 0

else

    sudo docker run -v $PWD:/home/work --expose=8899 -p 8899:8899 -w /home/work --entrypoint jupyter-notebook $DOCKER_NAME --ip 0.0.0.0 --port 8899 --allow-root

fi
