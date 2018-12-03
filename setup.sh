#!/bin/bash

script_name=${BASH_SOURCE}
script_dir=$(cd $(dirname ${BASH_SOURCE}); pwd)
cd ${script_dir}

################################################################################

mkdir -p work

# こっちのイメージの方が一般的？
# docker run -d --name jupyter -p 8888:8888 jupyter/datascience-notebook

docker stop jupyter
docker rm jupyter
docker run -d -v $(pwd)/work:/home/jovyan/work --name jupyter -p 8888:8888 jupyter/all-spark-notebook

# 必要に応じてライブラリを追加
docker exec jupyter /opt/conda/bin/pip install tensorflow
docker exec jupyter /opt/conda/bin/pip install keras

# ここで待たないとjupyter notebook listがうまくいかない
sleep 3

# tokenを出す
docker exec jupyter /opt/conda/bin/jupyter notebook list

# コンテナに入る
# docker exec -it jupyter /bin/bash
