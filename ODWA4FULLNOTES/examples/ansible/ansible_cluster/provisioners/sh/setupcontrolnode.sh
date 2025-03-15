#!/bin/bash
sudo apt update -y
sudo apt install -y software-properties-common
sudo apt install -y ansible

cp /vagrant/sshkeys/ansible /home/vagrant/.ssh/  
chmod 600 /home/vagrant/.ssh/ansible
