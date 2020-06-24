#!/bin/bash

# /dev/null 类似与一个黑洞
ping -c 3 -i 0.2 -W 3 $1 &> /dev/null

if [ $? -eq 0 ] 
then 
echo "Host $1 is Online."
else 
echo "Host $2 is Off-line"
fi