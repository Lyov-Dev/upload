#!/bin/bash
num=2
while [ $num -lt 2 ]; do
    sed 's/172.17.3\..*/172.17.3.$num/g' secrets-new2 > secrets-new3
    num=$(($num +1))
    echo $num
done
