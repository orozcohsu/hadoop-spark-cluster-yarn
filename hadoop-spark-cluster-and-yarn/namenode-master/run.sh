#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME 
fi

#start spark master
echo "Starting spark master service"
$SPARK_HOME/sbin/start-master.sh

#start namenode
echo "Starting namenode service"
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode

#spark.yarn.jars to hdfs
echo "PUT spark jars"
$HADOOP_PREFIX/bin/hadoop fs -mkdir -p /apps/spark
$HADOOP_PREFIX/bin/hadoop fs -put /usr/local/spark/jars/spark-jars.zip  /apps/spark
