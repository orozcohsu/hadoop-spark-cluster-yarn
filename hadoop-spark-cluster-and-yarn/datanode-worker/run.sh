#!/bin/bash

datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`
if [ ! -d $datadir ]; then
  echo "Datanode data directory not found: $datadir"
  exit 2
fi

#Starting spark worker
$SPARK_HOME/sbin/start-slave.sh spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT}

#Starting namenode service
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode

#Starting spark worker
#$SPARK_HOME/sbin/start-slaver.sh spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out
 
