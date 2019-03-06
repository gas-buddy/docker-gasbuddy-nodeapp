FROM node:10

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

RUN apt-get update && apt-get install -y libelf1 && rm -rf /var/lib/apt/lists/*
