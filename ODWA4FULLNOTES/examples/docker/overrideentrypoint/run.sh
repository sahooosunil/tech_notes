#!/bin/bash
set -e
if [ $# -gt 0 ]
then
    exec $@
else
    service apache2 start
    echo "Apache2 Started"
    tail -f /dev/null
fi
