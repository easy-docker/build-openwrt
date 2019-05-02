#!/bin/bash
if [ -z $1 ];then  
    j=1
else  
    j=$1
fi  
make V=s -j $j
