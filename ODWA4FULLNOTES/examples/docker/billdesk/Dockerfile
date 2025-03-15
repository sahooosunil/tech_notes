FROM ubuntu:24.04
RUN apt update -y
RUN apt install -y openjdk-17-jdk
RUN mkdir -p /u01/apps/
COPY target/billdesk-1.0.jar /u01/apps/
ENV CLASSPATH=/u01/apps/billdesk-1.0.jar
CMD ["java", "com.billdesk.main.BillDeskApplication"]