FROM ubuntu:20.04

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
      wget \
      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ARG shared_workspace=/opt/workspace

RUN mkdir -p ${shared_workspace}/data && \
    mkdir -p /usr/share/man/man1

RUN apt-get update 
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.6
RUN apt install -y python3.6-dev
RUN apt install -y python3.6-venv curl
RUN cd /usr/local/bin && ln -s /usr/bin/python3.6 python
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN curl https://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.deb -k -o scala.deb
RUN apt install -y ./scala.deb 
RUN rm -rf scala.deb /var/lib/apt/lists/* Python-3.8.7 Python-3.8.7.tgz

RUN apt-get update -y 
RUN PYSPARK_HADOOP_VERSION=2.7 pip install pyspark 
RUN pip install jupyterlab findspark pyarrow numpy==1.13.3 pandas joblib scikit-learn==0.24.2

ENV SCALA_HOME="/usr/bin/scala"
ENV SPARK_HOME="/usr/local/lib/python3.6/dist-packages/pyspark"
ENV PYSPARK_PYTHON="python3.6"
ENV PATH=${PATH}:${SCALA_HOME}/bin
ENV SHARED_WORKSPACE=${shared_workspace}

EXPOSE 8888

VOLUME ${shared_workspace}
WORKDIR ${SHARED_WORKSPACE}

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8888

CMD ["/run.sh"]

