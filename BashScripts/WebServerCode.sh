#!/bin/bash
DATE="$(date +%Y-%m-%d-%H:%M)"
echo "-----------------------------"
echo "Start scanning  $DATE"
STATUS_CODE=$(curl --head --max-time 10 -s -o /dev/null -w "%{http_code}\n" https://analytics.delion.ru/)
echo "Site have $STATUS_CODE status code"
if [ $STATUS_CODE != 200 ]
then
       echo "Site is not available"
fi
echo "End scanning"
