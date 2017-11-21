#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ]; then
  set -- node-app "$@"
fi

if [ "$1" = 'node-app' ]; then
  shift
  # Link in the mounted production.json if it's there - overwriting any existing file
  [ -f /config/production.json ] && ln -sf /config/production.json config/production.json
  [ "$#" -gt 0 -a "$1" != '--' ] && set -- '--' "$@"
  if [ "$#" -gt 0 ]; then
    exec dumb-init -- gosu node-app /usr/local/bin/npm start "$@"
  else
    exec dumb-init -- gosu node-app /usr/local/bin/npm start
  fi
fi

exec "$@"
