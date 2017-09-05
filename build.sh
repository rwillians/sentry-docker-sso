#!/bin/bash

set -ex

repo=$1
version=$2

docker build -t $repo:latest .
docker push $repo:latest
docker build -t $repo:$version .
docker push $repo:$version
