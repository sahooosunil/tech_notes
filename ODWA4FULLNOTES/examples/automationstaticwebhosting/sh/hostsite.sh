#!/bin/bash

function checkAndInstallApache2() {
    local CHECK_APACHE2_INSTALLED=$(dpkg -s apache2 | grep "Status:" | cut -d ":" -f2) 
    echo $CHECK_APACHE2_INSTALLED
    if [[ $CHECK_APACHE2_INSTALLED == *" install ok installed"* ]]
    then
        local CHECK_APACHE2_RUNNING_STATUS=$(sudo systemctl status apache2 | grep "Active:" | cut -d ":" -f2 | awk '{print $1}')
        if [ ! $CHECK_APACHE2_RUNNING_STATUS=="active" ]
        then
            return 200            
        fi
    else
        sudo apt update -y
        sudo apt install -y apache2
        local CHECK_APACHE2_INSTALLATION_STATUS=$?
        if [ $CHECK_APACHE2_INSTALLATION_STATUS -ne 0 ]    
        then
            return 300
        fi
    fi
    return 0
}

function checkAndCopySiteDirectory() {
    if [ ! -e /tmp/$SITE_DIR ]
    then
        return 400
    else
        sudo cp -r /tmp/$SITE_DIR /var/www/
    fi
    return 0
}

function createHostConfigAndEnableSite() {
    sudo cp /tmp/default.conf /etc/apache2/sites-available/$SITE_DIR.conf
    sudo sed -i 's/:SITE_DIR:/'$SITE_DIR'/g' /etc/apache2/sites-available/$SITE_DIR.conf
    sudo sed -i 's/:DOMAIN_NM:/'$DOMAIN_NM'/g' /etc/apache2/sites-available/$SITE_DIR.conf
    sudo a2ensite $SITE_DIR
    sudo systemctl daemon-reload
    sudo systemctl restart apache2
    return 0
}

#Main Block
NARGS=$#
if [ $NARGS -ne 2 ]
then
    echo "Error: site directory and domain name must be passed for hosting the site"
    exit 100
fi
SITE_DIR=$1
DOMAIN_NM=$2
checkAndInstallApache2

CHECK_AND_INSTALL_APACHE2_STATUS=$?
if [ $CHECK_AND_INSTALL_APACHE2_STATUS -eq 200 ]
then    
    echo "Error: Apache2 Server is not running, please start the server for hosting the website"
    exit 200
elif [ $CHECK_AND_INSTALL_APACHE2_STATUS -eq 300 ]
then
    echo "Error: Failed installing apache2 server, please check the logs"
    exit 300
else
    echo "Apache2 server is found running"
fi

checkAndCopySiteDirectory
CHECK_SITE_DIR_STATUS=$?
if [ $CHECK_SITE_DIR_STATUS -eq 400 ]
then
    echo "Error: $SITE_DIR not found under /var/www/, aborting hosting.."
    exit 400
fi

createHostConfigAndEnableSite
CREATE_HOST_CONFIG_AND_ENABLE=$?
if [ $CREATE_HOST_CONFIG_AND_ENABLE -ne 0 ]
then
    echo "Error: Failed while configuring the site and enabling it. Refer to logs"
    exit 500
fi
echo "$DOMAIN_NM hosted successfully..."


















