FROM node:6

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

RUN apt-get update && apt-get install -y libelf1 && rm -rf /var/lib/apt/lists/*

RUN curl -o- -L https://yarnpkg.com/install.sh | bash && \
  yarn global add node-gyp
