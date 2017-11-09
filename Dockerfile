FROM node:6-slim

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

ARG TINI_VERSION=0.16.1

# Reference: user management in alpine:
# RUN addgroup node-app && adduser -SDHG node-app node-app

# Attempt: user management in debian:
RUN groupadd node-app && adduser -D --system -H --groups node-app node-app

# Issue: apt-get is unable to find tini or su-exec
RUN apt-get update && apt-get install -y tini su-exec coreutils
RUN npm init -f > /dev/null

WORKDIR /pipeline/source

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "node-app" ]
