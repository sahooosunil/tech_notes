FROM ubuntu:24.04
RUN apt update -y
RUN apt install -y apache2
COPY run.sh /root/
RUN chmod u+x /root/run.sh
ENTRYPOINT [ "/root/run.sh" ]
