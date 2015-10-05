#!/bin/bash 

MASTER=$1
HOST=$(hostname)
if [ "$HOST" == "$MASTER" ]; then
	$SPARK_HOME/sbin/start-master.sh 
fi

$SPARK_HOME/sbin/start-slave.sh spark://$MASTER:7077  

tail -f /dev/null #wait forever

