#!/bin/bash

script_name=${BASH_SOURCE}
script_dir=$(cd $(dirname ${BASH_SOURCE}); pwd)
echo ${script_name}
echo ${script_dir}
cd ${script_dir}

################################################################################

mkdir -p work

# docker run -d --name jupyter -p 8888:8888 jupyter/datascience-notebook

docker stop jupyter
docker rm jupyter
docker run -d -v $(pwd)/work:/home/jovyan/work --name jupyter -p 8888:8888 jupyter/all-spark-notebook

# docker exec jupyter /opt/conda/bin/pip install tensorflow
sleep 5

docker exec jupyter /opt/conda/bin/jupyter notebook list
docker exec -it jupyter /bin/bash
