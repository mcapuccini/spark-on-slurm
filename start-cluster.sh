#!/bin/bash 

MASTER=$1
HOST=$(hostname)
if [ "$HOST" == "$MASTER" ]; then
	N_CORES=$(grep -c ^processor /proc/cpuinfo)
	$SPARK_HOME/sbin/start-master.sh 
	$SPARK_HOME/sbin/start-slave.sh spark://$MASTER:7077 --cores $((N_CORES-2)) 
else
	$SPARK_HOME/sbin/start-slave.sh spark://$MASTER:7077 
fi 

tail -f /dev/null #wait forever

