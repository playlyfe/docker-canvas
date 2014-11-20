#!/usr/bin/env bash
set -e

docker rm -f canvas_redis canvas_postgres canvas_apache 2> /dev/null || true

if [ "$1" == "data" ]; then
  docker rm -f canvas_redis_data canvas_postgres_data 2> /dev/null || true
  sudo rm /etc/canvas/setup.lock 2> /dev/null || true
fi

echo "canvas containers removed"
