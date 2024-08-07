#!/bin/bash

VERSION=2.462.1

if [ ! -d "/home/jenkins" ]; then
    echo "Please call 'sudo adduser jenkins'"
    exit 1
fi

if [ -f /usr/bin/jenkins ]; then
    echo "Removing /usr/bin/jenkins..."
    rm /usr/bin/jenkins
fi

echo "Updating /home/jenkins/jenkins_run.sh"
cp -rf ./jenkins_run.sh /home/jenkins/jenkins_run.sh
echo "Make link /home/jenkins/jenkins_run.sh -> /usr/bin/jenkins"
ln -s /home/jenkins/jenkins_run.sh /usr/bin/jenkins

if [ ! -f "/home/jenkins/jenkins-$VERSION.war" ]; then
    echo "Not found specify version jenkins."
    echo "Downloading.... from https://get.jenkins.io/war-stable/$VERSION/jenkins.war"
    wget -O "/home/jenkins/jenkins-$VERSION.war" https://get.jenkins.io/war-stable/$VERSION/jenkins.war
fi

echo "Updating /etc/systemd/system/jenkins.service"
cp -rf ./jenkins_systemd /etc/systemd/system/jenkins.service

echo "Reload systemd deamons"
systemctl daemon-reload

echo "Restarting jenkins.service"
systemctl restart jenkins
