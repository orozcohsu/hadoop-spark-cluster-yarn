FROM debian:9

MAINTAINER Orozco Hsu <orozcohsu@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
      libsnappy-dev \
      wget \
      scala \
      vim \
      zip \
      procps \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN gpg --import KEYS

#hadoop
#hadoop in /opt
ENV HADOOP_VERSION 2.7.4
ENV HADOOP_URL https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

#spark
#spark in /usr/local/spark
RUN wget -O /spark.tar.gz -q https://archive.apache.org/dist/spark/spark-2.4.1/spark-2.4.1-bin-hadoop2.7.tgz
RUN tar xfz spark.tar.gz
RUN mv /spark-2.4.1-bin-hadoop2.7 /usr/local/spark
RUN cp /usr/local/spark/conf/spark-defaults.conf.template /usr/local/spark/conf/spark-defaults.conf
RUN rm /spark.tar.gz
RUN zip /usr/local/spark/jars/spark-jars.zip /usr/local/spark/jars/*
ENV SPARK_HOME=/usr/local/spark

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN wget -O /usr/local/spark/jars/jersey-core-1.9.jar -q https://repo1.maven.org/maven2/com/sun/jersey/jersey-core/1.9/jersey-core-1.9.jar && wget -O /usr/local/spark/jars/jersey-server-1.9.jar -q https://repo1.maven.org/maven2/com/sun/jersey/jersey-server/1.9/jersey-server-1.9.jar && wget -O  /usr/local/spark/jars/jersey-client-1.9.jar -q https://repo1.maven.org/maven2/com/sun/jersey/jersey-client/1.9/jersey-client-1.9.jar

RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
ENV YARN_CONF_DIR=$HADOOP_CONF_DIR 
ENV MULTIHOMED_NETWORK=1

#PATH for hadoop and spark
ENV USER=root
ENV PATH $HADOOP_PREFIX/bin:$SPARK_HOME/bin:$SPARK_HOME:sbin:$PATH

ENV SPARK_MASTER_HOST namenode-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
