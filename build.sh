#!/bin/bash

cd "$(dirname "$0")"

repo=$1

docker pull sentry:latest
docker build -t "$repo" .

DIFF=$(docker inspect "$repo" | grep sha256: | diff .current - 2>&1)
if [ "$DIFF" != "" ] ; then
   echo "Build is different, pushing!"
   docker push "$repo"
   docker inspect "$repo" | grep sha256: > .current
else
   echo "Build is the same as previous, not pushing"
fi
