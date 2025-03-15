#!/bin/bash

while [ true ]
do
  AVAILABLE_MEM=$(free -h | grep Mem: | awk '{print $7}')
  echo "Available Memory : $AVAILABLE_MEM" >> /tmp/mem.log
  sleep 30s
done

