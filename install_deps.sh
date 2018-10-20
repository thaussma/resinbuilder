#!/usr/bin/env sh

sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common npm chrpath diffstat make jq texinfo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt-get remove docker
apt-cache policy docker-ce
sudo apt install docker-ce