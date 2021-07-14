FROM orozcohsu/hbase-base:1.0.0-hbase1.4.13

HEALTHCHECK CMD curl -f http://localhost:16010/ || exit 1

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 16000 16010

CMD ["/run.sh"]

