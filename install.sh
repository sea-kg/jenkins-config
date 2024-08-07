#!/bin/bash

check_ret() {
    if [ $1 -ne 0 ]; then
        echo ""
        echo "!!! FAIL: $2"
        echo "********************************************************************************"
        echo ""
        exit $1
    else
        echo ""
        echo "*** SUCCESS: $2"
        echo "********************************************************************************"
        echo ""
    fi
}

VERSION=2.462.1

if [ ! -d "/home/jenkins" ]; then
    echo "Please call 'sudo adduser jenkins'"
    exit 1
fi

if [ -f /usr/bin/jenkins ]; then
    echo "Removing /usr/bin/jenkins..."
    rm /usr/bin/jenkins
    check_ret $? "Removed /usr/bin/jenkins"
fi

echo "Updating /home/jenkins/jenkins_run.sh"
cp -rf ./jenkins_run.sh /home/jenkins/jenkins_run.sh
check_ret $? "Updated /home/jenkins/jenkins_run.sh"

echo "Make link /home/jenkins/jenkins_run.sh -> /usr/bin/jenkins"
ln -s /home/jenkins/jenkins_run.sh /usr/bin/jenkins
check_ret $? "Maked link for /usr/bin/jenkins"

if [ ! -f "/home/jenkins/jenkins-$VERSION.war" ]; then
    echo "Not found specify version jenkins."
    echo "Downloading.... from https://get.jenkins.io/war-stable/$VERSION/jenkins.war"
    wget -O "/home/jenkins/jenkins-$VERSION.war" https://get.jenkins.io/war-stable/$VERSION/jenkins.war
    check_ret $? "Downloaded /home/jenkins/jenkins-$VERSION.war"
fi

echo "Updating /etc/systemd/system/jenkins.service"
cp -rf ./jenkins_systemd /etc/systemd/system/jenkins.service
check_ret $? "Updated /etc/systemd/system/jenkins.service"

echo "Reload systemd deamons"
systemctl daemon-reload
check_ret $? "Reloaded systemd deamons"

echo "Adding jenkins to autostart"
systemctl enable jenkins
check_ret $? "Added jenkins to autostart"

echo "Restarting jenkins.service"
systemctl restart jenkins
check_ret $? "Restarted jenkins.service"


