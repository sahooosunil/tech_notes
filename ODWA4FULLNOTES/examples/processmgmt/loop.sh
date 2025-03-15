#!/bin/bash
I=1
while [ $I -lt 100 ]
do
  echo $I
  sleep 5
  I=$[I+1]
done
