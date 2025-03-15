FROM ubuntu:24.04
ENV JAVA_HOME=/u01/middleware/jdk-17.0.2
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=/u01/apps/luckygen-1.0.jar

RUN mkdir -p /u01/middleware/
RUN mkdir -p /u01/apps/

WORKDIR /u01/middleware/
ADD https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-aarch64_bin.tar.gz .
RUN tar -xzvf openjdk-17.0.2_linux-aarch64_bin.tar.gz 
RUN rm openjdk-17.0.2_linux-aarch64_bin.tar.gz
WORKDIR /u01/apps/
COPY target/luckygen-1.0.jar .

CMD [ "java", "com.ln.main.LuckyNumberApplication" ]