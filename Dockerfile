FROM mhart/alpine-node:14

MAINTAINER Max Metral <max@gasbuddy.com>

RUN apk add --no-cache git && \
    apk add --no-cache --virtual .npm-deps openssl make gcc g++ python && \
    apk add --no-cache libcurl curl

COPY npmrc /root/.npmrc

WORKDIR /data

ENTRYPOINT ["/bin/sh"]
