#!/bin/bash
uname -r
modprobe tcp_bbr
echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
apt-get update
sudo apt install python3-pip -y
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip
ssserver -c shadows-server.json -d start
# apt-get install python-pip
# pip install shadowsocks

