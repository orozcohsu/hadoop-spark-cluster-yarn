#!/bin/bash

nohup /opt/hbase-$HBASE_VERSION/bin/hbase rest start -p 4444 &
nohup /opt/hbase-$HBASE_VERSION/bin/hbase thrift start &
/opt/hbase-$HBASE_VERSION/bin/hbase master start

