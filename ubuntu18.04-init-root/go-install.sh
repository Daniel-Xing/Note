#!/usr/bin/zsh

proxychains4  wget https://studygolang.com/dl/golang/go1.13.4.linux-amd64.tar.gz
tar xfz go1.13.4.linux-amd64.tar.gz -C /usr/local

# vim .zshrc 
# # go env
#添加Gopath路径
# export GOPATH=/usr/local/go
# export PATH=$GOPATH/bin:$PATH
# export GO111MODULE=on
# GOPROXY=https://goproxy.cn,direct