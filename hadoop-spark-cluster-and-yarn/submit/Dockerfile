FROM orozcohsu/hadoop-base:1.0.0-hadoop2.7.4-java8

COPY WordCount.jar /opt/hadoop/applications/WordCount.jar
RUN chmod a+x /opt/hadoop/applications/WordCount.jar

ENV HADOOP_HOME="/opt/hadoop-2.7.4"
ENV JAR_FILEPATH="/opt/hadoop/applications/WordCount.jar"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/input /output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
