# DORE

## dockerコマンド

```
#Dockerコンテナを起動
docker-compose up

# バックグラウンドでDockerコンテナを起動したいは以下のコマンドで実行します。
docker-compose up -d

#Dockerコンテナを停止
docker-compose down

# バックグラウンドでDocekrコンテナを起動した場合は以下のコマンドでログの出力をします。
docker-compose logs -f web

# 再ビルドとアプリの再起動
docker-compose up --build

#完全に再ビルドを行う
docker-compose run web bundle install
docker-compose up --build
```

## docker rails関連コマンド

```
docker-compose exec rails <実行したいコマンド>

# bundle install
docker-compose exec rails bundle install

# DB作成
docker-compose exec rails rails db:create

# マイグレーション実行
docker-compose exec rails rails db:migrate

# データの投入
docker-compose exec rails rails db:seed

```

## Setup

```
# イメージ作成
docker compose build

# DBの構築
docker compose run --rm web rails db:create

# コンテナの立ち上げ
docker compose up -d
```