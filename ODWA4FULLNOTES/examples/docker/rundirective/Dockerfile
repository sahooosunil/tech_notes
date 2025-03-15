FROM ubuntu:24.04
RUN apt update -y
RUN apt install -y openjdk-17-jdk
RUN apt install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz
RUN tar -xzvf apache-tomcat-10.1.19.tar.gz
ENV TOMCAT_HOME=/apache-tomcat-10.1.19
ENV PATH=${PATH}:${TOMCAT_HOME}/bin
CMD ["/bin/bash", "-c", "catalina.sh run"]