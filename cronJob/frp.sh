#!/bin/bash

# echo "run script" >> /home/xingzheng/log/cronJobs/log.txt

if [ $(ps -ef | grep "frpc" | grep -c "http") -lt 1 ]
then
    echo "run frp-http" 
    $(nohup /home/xingzheng/frp/frpc -c /home/xingzheng/frp/frpc-http.ini >> /dev/null 2>&1 &) 
fi

if [ $(ps -ef | grep "frpc" | grep -c "ecs") -lt 1 ]
then
    echo "run frp-ssh" 
    $(nohup /home/xingzheng/frp/frpc -c /home/xingzheng/frp/frpc-ecs.ini >> /dev/null 2>&1 &) 
fi



