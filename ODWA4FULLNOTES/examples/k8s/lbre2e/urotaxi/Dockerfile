FROM --platform=amd64 ubuntu:24.04
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-10.1.23
ENV PATH=$PATH:$TOMCAT_HOME/bin

RUN apt update -y
RUN apt install -y openjdk-17-jdk
RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware/

ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.23/bin/apache-tomcat-10.1.23.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.23.tar.gz
RUN rm apache-tomcat-10.1.23.tar.gz

COPY run.sh $TOMCAT_HOME/bin
RUN chmod u+x $TOMCAT_HOME/bin/run.sh
COPY target/ROOT.war $TOMCAT_HOME/webapps
RUN rm -rf $TOMCAT_HOME/webapps/ROOT
ENTRYPOINT ["apache-tomcat-10.1.23/bin/run.sh"]