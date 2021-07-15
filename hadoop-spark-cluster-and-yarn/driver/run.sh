#!/bin/bash

echo "Starting to upload spark jars to HDFS"
hadoop fs -mkdir -p /apps/spark
hadoop fs -put /usr/local/spark/jars/spark-jars.zip  /apps/spark

tail -f /dev/null

