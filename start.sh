#!/bin/bash

script_name=${BASH_SOURCE}
script_dir=$(cd $(dirname ${BASH_SOURCE}); pwd)
cd ${script_dir}

################################################################################

docker start jupyter
# sleep 3
# docker exec jupyter /opt/conda/bin/jupyter notebook list
# docker exec -it jupyter /bin/bash
