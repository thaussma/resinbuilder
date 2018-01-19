#!/bin/bash

TAG=thaussma/resinbuilder-base

cd $(dirname $0)
docker build -t $TAG .
docker push $TAG 