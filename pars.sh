#!/bin/bash
start=0
startSec=0
startMin=01
endTime=5
while [ "$(( start += 1 ))" -le ${endTime} ]; do
    start=$( printf '%02d' "$start" )
    if [ $start != $endTime ];  
        then
        cat /Users/nicksonet/Downloads/load.log | grep "15/May/2019:16:${startMin}:${start}" | grep staticmap | wc -l 
        else
          if [ $start == $endTime ]; then 
            echo ${startMin}
            startMin=$(expr $startMin + 01)
            start=0
            if [ $startMin == $endTime ]; then 
               exit 0
            fi    
          fi      
    fi    
done