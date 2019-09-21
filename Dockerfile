FROM openjdk:8u222-jdk-stretch

ENV HADOOP_VERSION=3.1.2 \
    HIVE_VERSION=3.1.2 \
    HADOOP_HOME="/opt/hadoop" \
    HIVE_HOME="/opt/hive" \
    PATH=${PATH}:/opt/bin:/opt/hadoop/bin:/opt/hive/bin

ADD http://apache-mirror.8birdsvideo.com/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz /opt/
ADD http://apache-mirror.8birdsvideo.com/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz /opt/

WORKDIR /opt

RUN tar xzf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    rm -rf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    echo "[OK] hive" && \
    tar xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -rf  hadoop-${HADOOP_VERSION}.tar.gz && \
    echo "[OK] hadoop" && \
    ln -s apache-hive-${HIVE_VERSION}-bin ./hive && \
    echo "[OK] symlink to hive" && \
    ln -s hadoop-${HADOOP_VERSION} ./hadoop && \
    echo "[OK] symlink to hadoop"

WORKDIR /app
COPY root/ /

CMD /bootstrap.sh
