#!/bin/bash
#SBATCH -p node
#SBATCH -N 3
#SBATCH --qos=short
#SBATCH -t 15:00
#SBATCH -J spark-pi

MASTER=$(hostname)
srun ../start-cluster.sh $MASTER &

sleep 60 #give the cluster some time to start

#submit your job
$SPARK_HOME/bin/spark-submit \
	--class org.apache.spark.examples.SparkPi \
	--master spark://$MASTER:7077 \
	$SPARK_EXAMPLES_JAR \
  	1000

tail -f /dev/null #wait until the job is cancelled
