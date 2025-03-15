FROM ubuntu:24.04
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-10.1.19
ENV PATH=$PATH:$TOMCAT_HOME/bin

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware
RUN apt update -y
RUN apt install -y openjdk-17-jdk

ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.19.tar.gz
RUN rm apache-tomcat-10.1.19.tar.gz
EXPOSE 8080

CMD [ "catalina.sh", "run" ]
