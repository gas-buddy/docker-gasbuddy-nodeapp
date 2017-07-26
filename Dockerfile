FROM mhart/alpine-node:6

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

ARG TINI_VERSION=0.9.0

RUN addgroup node-app && adduser -SDHG node-app node-app

RUN apk add --no-cache tini su-exec coreutils
RUN npm init -f > /dev/null && \
  npm install npm@5 && \
  rm -rf /usr/lib/node_modules package.json ~/.npm && \
  mv node_modules /usr/lib

WORKDIR /pipeline/source

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "node-app" ]
