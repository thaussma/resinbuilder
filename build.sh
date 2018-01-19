#!/bin/bash

GIT_REPO=resin-os/resin-raspberrypi
GIT_REF=master
GIT_FOLDER=resin-raspberrypi-$GIT_REF

echo "GIT_REPO=$GIT_REPO"
echo "GIT_REF=$GIT_REF"
echo "GIT_FOLDER=$GIT_FOLDER"

sudo service docker start
sudo balenad&

git clone --recursive --depth 1 --branch $GIT_REF https://github.com/$GIT_REPO $GIT_FOLDER

# Dry run to create config
./$GIT_FOLDER/resin-yocto-scripts/build/barys -n --shared-downloads $(pwd)/shared-downloads/ --shared-sstate $(pwd)/shared-sstate/ -m raspberrypi3

# Build
./$GIT_FOLDER/resin-yocto-scripts/build/barys -r --shared-downloads $(pwd)/shared-downloads/ --shared-sstate $(pwd)/shared-sstate/ -m raspberrypi3
