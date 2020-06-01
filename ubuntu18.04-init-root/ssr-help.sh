#!/bin/bash

npm install -g ssr-helper
sudo apt-get update
sudo apt-get install git -y
git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git
ssr config /root/shadowsocksr
sudo apt-get install build-essential libsodium-dev -y

