# Spark on SLURM
This repository contains a lightweight scripts collection that you can use in order to run
Spark jobs on SLURM, via sbatch. The scripts were tested using Spark 1.4.0 on 
UPPMAX (http://www.uppmax.uu.se/) milou HPC cluster. 

## Configuration
The minimal configuration requirement consists in having a SPARK_HOME
environment variable pointing to the Spark installation folder:

    #/.bashrc
    export SPARK_HOME="/path/to/spark-version"

However, since you are probably running on HPC you may want to configure Spark in order to write
logs and temporary files on local scratch:

    #$SPARK_HOME/conf/spark-env.sh
    #This configuration is known to work UPPMAX milou
    export SPARK_LOCAL_DIRS=$(mktemp -d)
    export SPARK_WORKER_DIR=$(mktemp -d)
    export SPARK_LOG_DIR="$TMPDIR/spark-logs"
    mkdir -p $SPARK_LOG_DIR

Finally, in order to test your configuration you may want to run:

    export SPARK_EXAMPLES_JAR="/path/to/spark-examples.jar"
    sbatch -A <your_project_id> examples/spark-pi.sh

##Examples
For usage please refer to the example directory in this repository. 
