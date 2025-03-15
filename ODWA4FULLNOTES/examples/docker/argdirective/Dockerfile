FROM ubuntu:24.04
ARG JAVA_PKG_NM=openjdk-11-jdk
RUN apt update -y
RUN apt install -y ${JAVA_PKG_NM}
CMD [ "/bin/bash", "-c", "java -version" ]