FROM mhart/alpine-node:8

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

ARG TINI_VERSION=0.9.0

RUN addgroup node-app && adduser -SDHG node-app node-app

RUN apk add --no-cache su-exec && \
    apk add --no-cache git && \
    apk add --no-cache --virtual .npm-deps openssl make gcc g++ python && \
    apk add --no-cache --virtual .tini-deps gnupg && \
    export GNUPGHOME="$(mktemp -d)" && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 && \
    wget -O tini "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static" && \
    wget -O tini.asc "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc" && \
    gpg --verify-files tini.asc && \
    install -t /usr/local/bin/ tini && \
    rm -r tini tini.asc "$GNUPGHOME" && \
    apk del .tini-deps

WORKDIR /data

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "node-app" ]

ONBUILD ARG NPM_TOKEN

ONBUILD COPY package.json .

ONBUILD RUN echo '//registry.npmjs.org/:_authToken=${NPM_TOKEN}' > .npmrc && \
    NPM_TOKEN=${NPM_TOKEN} npm install --unsafe-perm && \
    rm -r .npmrc /root/.npm /root/.node-gyp && \
    apk del .npm-deps

ONBUILD COPY . .

ONBUILD RUN chown -R node-app:node-app . && \
    npm run build || true

ONBUILD RUN apk del git
