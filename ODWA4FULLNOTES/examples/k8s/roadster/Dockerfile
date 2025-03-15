FROM ubuntu:24.04
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-10.1.20/
ENV PATH=$PATH:${TOMCAT_HOME}/bin

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware
RUN apt update -y
RUN apt install -y openjdk-17-jdk

ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.20/bin/apache-tomcat-10.1.20.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.20.tar.gz 
RUN rm apache-tomcat-10.1.20.tar.gz

COPY target/roadster.war apache-tomcat-10.1.20/webapps
COPY run.sh apache-tomcat-10.1.20/bin/

EXPOSE 8080

RUN chmod u+x apache-tomcat-10.1.20/bin/run.sh
ENTRYPOINT [ "apache-tomcat-10.1.20/bin/run.sh" ]