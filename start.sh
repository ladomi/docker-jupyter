#!/bin/bash

script_name=${BASH_SOURCE}
script_dir=$(cd $(dirname ${BASH_SOURCE}); pwd)

echo ${script_name}
echo ${script_dir}

cd ${script_dir}

docker start jupyter
docker exec jupyter /opt/conda/bin/jupyter notebook list
docker exec -it jupyter /bin/bash
