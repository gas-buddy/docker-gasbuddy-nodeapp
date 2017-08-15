FROM mhart/alpine-node:6

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

RUN apk add --no-cache git && \
    apk add --no-cache --virtual .npm-deps openssl make gcc g++ python

RUN npm init -f > /dev/null && \
  npm install npm@5 && \
  rm -rf /usr/lib/node_modules package.json ~/.npm && \
  mv node_modules /usr/lib

COPY npmrc /root/.npmrc

WORKDIR /data

ENTRYPOINT ["/bin/sh"]
