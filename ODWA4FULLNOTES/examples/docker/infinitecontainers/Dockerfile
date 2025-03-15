FROM ubuntu:24.04
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-10.1.19
ENV PATH=$PATH:$TOMCAT_HOME/bin

RUN apt update -y
RUN apt install -y openjdk-17-jdk

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.19.tar.gz
RUN rm apache-tomcat-10.1.19.tar.gz

COPY run.sh /u01/middleware/apache-tomcat-10.1.19/bin
RUN chmod u+x /u01/middleware/apache-tomcat-10.1.19/bin/run.sh


ENTRYPOINT [ "apache-tomcat-10.1.19/bin/run.sh" ]
