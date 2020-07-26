#!/bin/bash

git config --global https.proxy 'socks5://127.0.0.1:1080'
git config --global http.proxy 'socks5://127.0.0.1:1080'

cd ~
git clone git@github.com:rofl0r/proxychains-ng.git
cd proxychains-ng/
./configure --prefix=/usr --sysconfdir=/etc
make && make install
sudo cp proxychains.conf ~/


## 修改配置文件