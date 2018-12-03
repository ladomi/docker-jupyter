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
# sleep 3

# # tokenを出す
# docker exec jupyter /opt/conda/bin/jupyter notebook list

# アクセス制限をとっぱらう
docker cp jupyter:/home/jovyan/.jupyter/jupyter_notebook_config.py ./
cat >> ./jupyter_notebook_config.py << EOS
c = get_config()
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.token = ''
EOS
docker cp ./jupyter_notebook_config.py jupyter:/home/jovyan/.jupyter/jupyter_notebook_config.py
rm -f ./jupyter_notebook_config.py
docker restart jupyter

# コンテナに入る
# docker exec -it jupyter /bin/bash
