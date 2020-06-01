#!/bin/bash

sudo apt-get install node.js -y  
sudo apt-get install npm -y
sudo npm config set registry https://registry.npm.taobao.org
sudo npm config list 
sudo npm install n -g
sudo n stable   
sudo npm install cnpm -g
sudo cnpm install vue
sudo cnpm install --global vue-cli
