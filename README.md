# [WashletSearchApp](https://washlet-search.herokuapp.com/)

**Total Washlet Count: 3452 over**  ⚠︎2019/4

## 💻 demo

![washletSearch](https://user-images.githubusercontent.com/36298285/68560233-937ea980-0483-11ea-8b51-fe01a5968bf4.gif)

## 💬 About

An application that allows you to register, search, and guide toilets with Wahlets nationwide.


## 🌻 Version

||Name|Version|What|
|:-:|:-:|:-:|:-|
|backend|ruby|2.6.3|High-level languages|
||Ruby on Rails|5.1.7|Web FrameWork|
|DB|Postgresql|11.5|Database|

## 🔰 Install & Setup

#### 1. Download Docker

The following procedure, please install Docker For Mac or Docker For Windows

[https://docs.docker.com/install/](https://docs.docker.com/install/)

#### 2. Getting source code

```bash
$ git clone https://github.com/katsuomi/WashletSearchApp.git
$ cd WashletSearchApp
```

#### 3. Start-up

The following procedure, start the container.

```bash
# Create Docker image
$ docker-compose build

# Start Docker container
$ docker-compose up

# Create DB
$ docker-compose exec web rails db:create

# migration
$ docker-compose exec web rails db:migrate

# test
$ docker-compose exec web rspec

# confirm
$ docker-compose ps
```

If the following local server started, it's ok.

|host||
|:-:|:-:|
|web|[http://localhost:3000](http://localhost:3000)|
|db|tcp:5432|

## ⚠️ note
**Environment variable setting is required.**

Please describe the following settings after creating .env file.
```
  (.env)
  GOOGLE_MAPS_API_KEY=*********************************
```


