#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ]; then
  set -- node-app "$@"
fi

if [ "$1" = 'node-app' ]; then
  shift
  [ "$#" -gt 0 -a "$1" != '--' ] && set -- '--' "$@"
  if [ "$#" -gt 0 ]; then
    exec tini -- su-exec node-app /usr/bin/npm start "$@"
  else
    exec tini -- su-exec node-app /usr/bin/npm start
  fi
fi

exec "$@"
