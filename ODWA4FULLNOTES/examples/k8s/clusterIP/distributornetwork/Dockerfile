From ubuntu:24.04
RUN apt update -y
RUN apt install -y openjdk-17-jdk

RUN mkdir -p /u01/apps
WORKDIR /u01/apps
COPY target/distributornetwork.jar .
ENTRYPOINT ["java", "-jar", "distributornetwork.jar"]