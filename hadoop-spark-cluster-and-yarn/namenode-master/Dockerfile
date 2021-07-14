FROM orozcohsu/hadoop-spark-base:1.0.0-hadoop2.7.4-spark2.4.1
MAINTAINER Orozco Hsu <orozcohsu@hotmail.com>

HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

#hadoop
ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

#spark
ENV SPARK_HOME=/usr/local/spark

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8020 9000 50070 8080 7077

#runtime
WORKDIR ${SPARK_HOME}

CMD ["/run.sh"]
