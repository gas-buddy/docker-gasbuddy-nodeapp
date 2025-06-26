# ARGs for configurable node version and tag
ARG NODE_VERSION=18
ARG NODE_TAG=alpine

FROM node:${NODE_VERSION}-${NODE_TAG}

LABEL org.opencontainers.image.vendor="GasBuddy"
LABEL org.opencontainers.image.title="GasBuddy Node.js Application Image"
LABEL org.opencontainers.image.description="Custom Docker image for GasBuddy Node.js applications"
LABEL org.opencontainers.image.source="https://github.com/gas-buddy/docker-gasbuddy-nodeapp"

COPY entrypoint.sh /entrypoint.sh
COPY fakesh /usr/local/bin/

RUN addgroup node-app && adduser -SDHG node-app node-app
RUN apk add --no-cache git && \
    apk add --no-cache --virtual .npm-deps openssl make gcc g++ python3 && \
    apk add --no-cache libcurl curl && \
    apk add --no-cache tini su-exec coreutils && \
    chmod 755 /entrypoint.sh && \
    chmod 755 /usr/local/bin/fakesh

WORKDIR /pipeline/source

ENV NO_UPDATE_NOTIFIER 1

ENTRYPOINT ["/entrypoint.sh"]
CMD [ "node-app" ]
