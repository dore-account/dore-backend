# DORE

## dockerコマンド

```
#Dockerコンテナを起動
docker-compose up

#デバック用のコンテナを起動
docker-compose -f docker-compose.debug.yml up

# バックグラウンドでDockerコンテナを起動したいは以下のコマンドで実行します。
docker-compose up -d

#Dockerコンテナを停止
docker-compose down

# バックグラウンドでDocekrコンテナを起動した場合は以下のコマンドでログの出力をします。
docker-compose logs -f web

# 再ビルドとアプリの再起動
docker-compose up --build

#完全に再ビルドを行う
docker-compose run --rm web bundle install
docker-compose up --build
```

## docker rails関連コマンド

```
docker-compose exec web <実行したいコマンド>

# bundle install
docker-compose exec web bundle install

# DB作成
docker-compose exec web bundle exec rails db:create

# マイグレーション実行
docker-compose exec web bundle exec rails db:migrate

# 直近のマイグレーションをリセットして実行
docker-compose exec web bundle exec rails db:migrate:redo

# データの投入
docker-compose exec web rails db:seed

# モデルの作成
docker-compose exec web bundle exec rails generate model モデル名

```

## beybugを使う

```
# コンテナを起動
## アタッチするコマンドを入力
docker attach <container name or ID>
// docker attach dore-backend_web_1

# デタッチ
Ctrl-P Ctrl-Q

# コマンド
next       一行進む
continue   次のブレイクポイントに進む
quit       終了
step       メソッドの内部にステップインする
list       ソースコードを表示する
up         ソースコードの上を表示する
down       ソースコードの下を表示する
```

### railsコンソールを使う

```
#入りたいコンテナ名を確認
docker ps

#コンテナに入る
docker exec -it コンテナ名 /bin/bash

// docker exec -it dore-backend-web-1 /bin/bash

#railsコンソールを開く
root@96913c74e902:/app# bundle exec rails c

irb(main):001:0>

# 終了する場合
##末尾が0以外だと抜けられない（式の途中と見做されている）
irb(main):014:2> quit
irb(main):015:2> exit
irb(main):016:2>

##ctrl + c でクリアしてからexit
irb(main):017:0> exit

```

## Graphql

```
# query type作成コマンド
$ bundle exec rails g graphql:object クラス名

# mutation type作成コマンド
$ bundle exec rails g graphql:mutation クラス名

# Schemaファイルを自動生成
# $ rake graphql:schema:dump
```

## Setup

```
# 作業リポジトリを作成(必要ならば)
mkdir dore-project

# ローカルにclone
git clone git@github.com:tamaki8021/dore-backend.git

# イメージ作成
docker compose build

# DBの構築
docker compose run --rm web rails db:create
docker compose run --rm web rails db:migrate

# コンテナの立ち上げ
docker compose up -d

### m1 mac の方
ビルドに失敗した場合は、Dockerfileに書いてあるように https -> httpにしてください。
```

```
# GraphiQlアプリのインストール
$ brew install --cask graphiql
```
