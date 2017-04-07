FROM mhart/alpine-node:6

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

RUN apk add --no-cache git && \
    apk add --no-cache --virtual .npm-deps openssl make gcc g++ python && \
    apk add --no-cache libcurl curl && \
    apk add --no-cache --virtual .yarn-deps gnupg tar && \
    mkdir -p /opt && \
    curl -sL https://yarnpkg.com/latest.tar.gz | tar xz -C /opt && \
    mv /opt/dist /opt/yarn && \
    ln -s /opt/yarn/bin/yarn /usr/local/bin && \
    apk del .yarn-deps

COPY npmrc /root/.npmrc

WORKDIR /data

ENTRYPOINT ["/bin/sh"]
