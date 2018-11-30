# docker-jupyter

kaggleをしたいのでjupyter環境をdockerで作ります。  
使用するdocker imageは`jupyter/all-spark-notebook`です。

## requirements

* docker

## usage

docker imageのpullとコンテナ作成・起動まで行う。  
jupyterという名前のコンテナができる。  
実行するたびに初期化されたコンテナが立ち上がる。  
つまり、同名の既存のコンテナは停止＆削除されるため注意。  
でもnotebookやデータはホスト側にリンクさせるため消えない仕様。

```bash
bash setup.sh
```

以下のように出力され、コンテナが起動される。ついでにコンテナに入る。

```
$ bash setup.sh 
jupyter
jupyter
(コンテナID)
Currently running servers:
http://0.0.0.0:8888/?token=(token文字列) :: /home/jovyan
jovyan@8b38641121bb:~$ 
```

ブラウザで`localhost:8888`にアクセスし、上記のtoken文字列をコピペするとjupyterにログインできる。

コンテナ作成時にホストの`docker-jupyter/work`ディレクトリがコンテナの`/home/jovyan/work`にマウントされている。  
jupyter上で作成したnotebookはここに保存されるし、データのアップロードもここからできるので便利( ´∀｀)bｸﾞｯ!

停止しているコンテナを起動したい場合。

```bash
bash start.sh
```

## reference

* qiita
    * https://qiita.com/kshigeru/items/2cd504e927869163b4c8

* docker image
    * https://hub.docker.com/r/jupyter/datascience-notebook/
    * https://hub.docker.com/r/jupyter/all-spark-notebook/

# kaggle

## reference

* titanic
    * https://www.codexa.net/kaggle-titanic-beginner/

# data scienceの勉強

## 決定木 decision tree
* targetをよく分割できる変数から枝分かれさせていく感じ。
* 回帰もできる。
* https://dev.classmethod.jp/machine-learning/2017ad_20171211_dt-2/

## randam forest
* データセットからランダムサンプリングしてサブセットを複数つくり、  
  使うパラメータもランダムで選び、それぞれに対して決定木を作って線形結合する。
* https://ja.wikipedia.org/wiki/%E3%83%A9%E3%83%B3%E3%83%80%E3%83%A0%E3%83%95%E3%82%A9%E3%83%AC%E3%82%B9%E3%83%88

## gradient boosting
* データセットを学習した予測器と、残差誤差を学習した予測器を組み合わせて新たな予測器をつくる。
* http://st-hakky.hatenablog.com/entry/2017/08/08/092031

## lightgbmとxgboost
* どちらもgradient boostingとrandom forestの組み合わせらしい。
* 決定木を深さ優先で作るか幅優先で作るかの違いらしい。
* https://qiita.com/TomokIshii/items/3729c1b9c658cc48b5cb

