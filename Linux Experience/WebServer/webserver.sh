#!/bin/bash
#
# webserver.sh - infrastructure as code
#
# Site        : Dio https://web.dio.me/
# Course      : Linux Experience
# Instructor  : Denilson Bonatti
# Author      : Alexandre Rodrigues Nettho <ohtten@gmail.com>
#
#
# Version History
# v1.0 2022, Alexandre Rodrigues Nettho
# -------------------------------------------------------------


echo "Starting Update System"

# Update System

sudo apt-get update && sudo apt-get dist-upgrade -y

echo "Install apache2, unzip and wget ..."

# Install apache2

sudo apt-get install apache2 -y

# Install unzip

sudo apt-get install unzip -y

# Install wget

sudo apt-get install wget -y

echo "Download and copy files in progress..."

# Copy with wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip in /tmp and decompress zip file

cd /tmp && wget main.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# decompress zip file
sudo unzip main.zip 

# Copy all files of the main "linux-site-dio-main" for /var/www/html

sudo cp -R /tmp/linux-site-dio-main/*.*  /var/www/html

echo "successfully concluded"



