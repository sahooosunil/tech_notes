ARG MYSQL_PASSWORD=mysqladm@007
FROM ubuntu:24.04
RUN echo ${MYSQL_PASSWORD} > ~/mysqlconf
CMD ["/bin/bash", "-c", "cat ~/mysqlconf"]