#!/bin/bash

TAG=resinbuilder
ID_USER=`id -u $USER`
ID_GROUP=`id -g $USER`
echo "Building $TAG for user $USER($ID_USER:$ID_GROUP)"

cd $(dirname $0)
docker build --build-arg UID=$ID_USER --build-arg GID=$ID_GROUP -t $TAG .
