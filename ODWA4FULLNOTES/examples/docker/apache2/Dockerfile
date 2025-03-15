FROM ubuntu:24.04
RUN apt update -y
RUN apt install -y apache2
COPY run.sh /home/root/
RUN chmod u+x /home/root/run.sh
ENTRYPOINT  ["/home/root/run.sh"]