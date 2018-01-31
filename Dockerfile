FROM node:8-alpine

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

ARG TINI_VERSION=0.16.1

RUN addgroup node-app && adduser -SDHG node-app node-app

RUN apk add --no-cache tini su-exec coreutils
RUN npm init -f > /dev/null

WORKDIR /pipeline/source

COPY entrypoint.sh /entrypoint.sh
COPY fakesh /usr/local/bin/

ENV NO_UPDATE_NOTIFIER 1

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "node-app" ]
