FROM node:6-slim

MAINTAINER GasBuddy <amougeot@gasbuddy.com>

RUN apt-get update && \
    apt-get install -yq git && \
    apt-get install -yq openssl make gcc g++ python && \
    apt-get install -yq curl && \
    apt-get install -yq gnupg tar && \
    mkdir -p /opt

COPY npmrc /root/.npmrc
WORKDIR /data

ENTRYPOINT ["/bin/bash"]