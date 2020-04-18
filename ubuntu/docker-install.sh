#!/bin/bash

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common curl -y
curl -fsSL https://mirror.azure.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://mirror.azure.cn/docker-ce/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce
docker --version
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
