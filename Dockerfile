FROM node:14

MAINTAINER Max Metral <max@gasbuddy.com>

RUN apt-get update && apt-get install -y libelf1 && rm -rf /var/lib/apt/lists/*
