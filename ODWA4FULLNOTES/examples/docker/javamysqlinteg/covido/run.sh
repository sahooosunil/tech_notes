#!/bin/bash
set -e

if [ $# -gt 0 ]
then
    exec $@
else
    nohup $TOMCAT_HOME/bin/startup.sh 
    tail -f /dev/null
fi

