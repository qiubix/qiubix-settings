#!/bin/bash

echo "Configuring java development environment..."

echo "Installing Oracle JDK 8..."
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java8-installer
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" | sudo tee -a /etc/environment

echo "Installing JVM tools..."
sudo apt install maven gradle

echo "Installing PostgreSQL"
sudo apt install postgresql
