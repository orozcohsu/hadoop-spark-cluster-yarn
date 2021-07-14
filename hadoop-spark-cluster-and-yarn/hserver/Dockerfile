FROM orozcohsu/hive-base:1.0.0-hive2.3.2

HEALTHCHECK CMD netstat -an | grep 9083 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]

