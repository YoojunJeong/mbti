SERVICE_ROOT=/home/ec2-user
SERVICE_NAME=ParkingOn
SERVICE_VERSION=D00C0120171030
SERVICE_HOME=$SERVICE_ROOT/parkingon-admin
SPRING_PROFILES=stg
SPRING_LOG_LEVEL=debug

if [ ! -d logs ]
then
   mkdir logs
fi

Log=logs/parkingon_service.log
DATE=`date`

echo "####################################################" >> $Log
echo "$SERVICE_NAME startup..." >> $Log

Cnt=`ps -ef | grep $SERVICE_NAME-$SERVICE_VERSION | grep -v grep | wc -l`
PROCESS=`ps -ef | grep $SERVICE_NAME-$SERVICE_VERSION | grep -v grep | awk '{print $2}'`

if [ $Cnt -ne 0 ]
then
   echo "$DATE : $SERVICE_NAME-$SERVICE_VERSION(PID : $PROCESS) is already running" >> $Log
   echo "$DATE : $SERVICE_NAME-$SERVICE_VERSION(PID : $PROCESS) is already running"
else
   nohup `java -Xms1024m -Xmx2048m -Dfile.encoding=UTF8 -Dspring.profiles.active=$SPRING_PROFILES  -jar $SERVICE_HOME/$SERVICE_NAME-$SERVICE_VERSION.war` 1>/dev/null 2>&1 &

   echo "$DATE : $SERVICE_NAME-$SERVICE_VERSION startup" >> $Log
   echo "$DATE : $SERVICE_NAME-$SERVICE_VERSION startup"
fi

echo "###################################################" >> $Log
echo "" >> $Log