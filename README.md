# jenkins-install

Short install:

```
$ sudo apt install git openjdk-21-jre-headless
$ sudo adduser jenkins
$ sudo git clone https://github.com/sea-kg/jenkins-install /home/jenkins/jenkins-install.git
$ cd /home/jenkins/jenkins-install.git
$ sudo ./install.sh
```

Will be here:

http://localhost:8082/


Check status:
```
$ systemctl status jenkins.service
```

## Manual Download

Download from here https://www.jenkins.io/download/

## Helper Getting started with the Guided Tour

Original item: https://www.jenkins.io/doc/pipeline/tour/getting-started/

This guided tour introduces you to the basics of using Jenkins and its main feature, Jenkins Pipeline. This tour uses the "standalone" Jenkins distribution, which runs locally on your own machine.
Prerequisites

For this tour, you will require:

    A machine with:

        256 MB of RAM, although more than 2 GB is recommended

        10 GB of drive space (for Jenkins and your Docker image)

    The following software installed:

        Java 11, 17, or 21

        Docker (navigate to Get Docker site to access the Docker download that’s suitable for your platform)

Download and run Jenkins

    Download Jenkins Generic Java package (.war)

    Open up a terminal in the download directory

    Run java -jar jenkins.war --httpPort=8080

    Browse to http://localhost:8080

    Follow the instructions to complete the installation

When the installation is complete, you can start putting Jenkins to work!


## Helper systemd example

https://www.jenkins.io/doc/book/system-administration/systemd-services/