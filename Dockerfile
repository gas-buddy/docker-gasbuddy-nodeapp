FROM mhart/alpine-node:6

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

ARG TINI_VERSION=0.9.0

RUN addgroup node-app && adduser -SDHG node-app node-app

RUN apk add --no-cache tini su-exec coreutils

WORKDIR /pipeline/source

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "node-app" ]
