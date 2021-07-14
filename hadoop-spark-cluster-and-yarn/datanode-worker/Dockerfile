FROM orozcohsu/hadoop-spark-base:1.0.0-hadoop2.7.4-spark2.4.1 
MAINTAINER Orozco Hsu <orozcohsu@hotmail.com>

HEALTHCHECK CMD curl -f http://localhost:50075/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50075 8081

#runtime
WORKDIR ${SPARK_HOME}

CMD ["/run.sh"]
