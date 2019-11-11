# WashletSearchApp

## 💬 About

全国のWahlet付きトイレの登録・検索・案内ができるアプリ WashletSearchApp
rubyのWebフレームワークRuby on Railsを利用。

## 🌻 Version

||Name|Version|What|
|:-:|:-:|:-:|:-|
|backend|ruby|2.6.3|高級言語|
||Ruby on Rails|5.1.7|Webフレームワーク|
|DB|Postgresql|11.5|データベース|

## 🔰 Install & Setup

#### 1. Dockerのダウンロード

下記より、`Docker For Mac` か `Docker For Windows`をインストールして下さい。  
[https://docs.docker.com/install/](https://docs.docker.com/install/)

#### 2. ソースコードの取得

```bash
$ git clone https://github.com/katsuomi/WashletSearchApp.git
$ cd WashletSearchApp
```

#### 3. 起動

下記の手順で、コンテナを起動させて下さい。

```bash
# Dockerイメージの作成
$ docker-compose build

# Dockerコンテナの起動
$ docker-compose up -d

# dbの作成
$ docker-compose exec web rails db:create

# migrationの実行
$ docker-compose exec web rails db:migrate

# テストの実行
$ docker-compose exec web rspec

# 確認
$ docker-compose ps
```

下記のコンテナが起動していれば、OKです。

|host||
|:-:|:-:|
|web|[http://localhost:3000](http://localhost:3000)|
|db|tcp:5432|
