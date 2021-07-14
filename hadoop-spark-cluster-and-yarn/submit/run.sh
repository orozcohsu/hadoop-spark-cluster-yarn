#!/bin/bash

hadoop fs -rmr         /output
hadoop fs -mkdir       /input
hadoop fs -chmod g+w   /input
echo 'Hello World Bye World' | hadoop fs -put - /input/test.txt


$HADOOP_HOME/bin/hadoop jar $JAR_FILEPATH $CLASS_TO_RUN $PARAMS
