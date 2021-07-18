hadoop_spark_branch := 1.0.0-hadoop2.7.4-spark2.4.1
jupyterlab_branch := 1.0.0.0-jupyter3.0.0

build:
	docker build -t orozcohsu/hadoop-spark-base:$(hadoop_spark_branch) ./hadoopsparkbase
	docker build -t orozcohsu/hadoop-namenode-master:$(hadoop_spark_branch) ./namenode-master
	docker build -t orozcohsu/hadoop-datanode-worker:$(hadoop_spark_branch) ./datanode-worker
	docker build -t orozcohsu/hadoop-driver:$(hadoop_spark_branch) ./driver
	docker build -t orozcohsu/jupyterlab:$(jupyterlab_branch) ./jupyterlab
