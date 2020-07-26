#!/bin/bash

# npm install -g ssr-helper
# sudo apt-get update
# sudo apt-get install git -y
# git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git
# ssr config /root/shadowsocksr
# sudo apt-get install build-essential libsodium-dev -y

sudo tar -xvf trojan-1.16.0-linux-amd64.tar.xz -C ~
sudo cp ~/trojan/trojan /usr/bin
sudo cp config-client.json ~/
sudo touch ~/trojan.log
nohup trojan -c ~/config-client.json >> ~/trojan.log 2>&1 &
