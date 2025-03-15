#!/bin/bash

if [ ! -f /u01/middleware/apache-tomcat-10.1.24 ]
then
    sudo apt update -y
    sudo apt install -y openjdk-17-jdk

    sudo mkdir -p /u01/middleware
    sudo chown ubuntu:ubuntu -R /u01

    wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.24/bin/apache-tomcat-10.1.24.tar.gz -P /u01/middleware
    tar -xzvf /u01/middleware/apache-tomcat-10.1.24.tar.gz -C /u01/middleware
    rm /u01/middleware/apache-tomcat-10.1.24.tar.gz 

    sudo cp /tmp/tomcat.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable tomcat.service
    sudo systemctl start tomcat
fi
sudo systemctl stop tomcat
rm -rf /u01/middleware/apache-tomcat-10.1.24/webapps/hangout*
cp /tmp/hangout.war /u01/middleware/apache-tomcat-10.1.24/webapps
sudo systemctl start tomcat


