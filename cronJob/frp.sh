#!/bin/bash
###
 # @Author: your name
 # @Date: 2021-03-03 03:28:13
 # @LastEditTime: 2021-10-11 19:36:14
 # @LastEditors: your name
 # @Description: In User Settings Edit
 # @FilePath: /Note/cronJob/frp.sh
### 

# echo "run script" >> /home/xingzheng/log/cronJobs/log.txt

if [ $(ps -ef | grep "frpc" | grep -c "http") -lt 1 ]
then
    echo "run frp-http" 
    $(nohup /home/xingzheng/frp/frpc -c /home/xingzheng/frp/frpc-http.ini >> /home/xingzheng/frp/http.out 2>&1 &) 
fi

if [ $(ps -ef | grep "frpc" | grep -c "ecs") -lt 1 ]
then
    echo "run frp-ssh" 
    $(nohup /home/xingzheng/frp/frpc -c /home/xingzheng/frp/frpc-ecs.ini >> /home/xingzheng/frp/ssh.out 2>&1 &) 
fi



