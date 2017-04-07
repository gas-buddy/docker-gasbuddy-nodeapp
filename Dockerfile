FROM node:6

MAINTAINER Jean-Charles Sisk <jeancharles@gasbuddy.com>

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
