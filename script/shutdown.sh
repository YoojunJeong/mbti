#!/bin/sh

SERVICE_NAME=ParkingOn

if [ ! -d logs ]
then
   mkdir logs
fi

Log=logs/adid_service.log
DATE=`date`

echo "####################################################" >> $Log
echo "$SERVICE_NAME shutdown..." >> $Log

Cnt=`ps -ef | grep $SERVICE_NAME | grep -v grep | wc -l`
PROCESS=`ps -ef | grep $SERVICE_NAME | grep -v grep | awk '{print $2}'`

if [ $Cnt -ne 0 ]
then
   kill -9 $PROCESS
   echo "$DATE : $SERVICE_NAME(PID : $PROCESS) Shutdown" >> $Log
   echo "$DATE : $SERVICE_NAME(PID : $PROCESS) Shutdown"
else
   echo "$DATE : $SERVICE_NAME is not running" >> $Log
   echo "$DATE : $SERVICE_NAME is not running"
fi

echo "###################################################" >> $Log
echo "" >> $Log
 
