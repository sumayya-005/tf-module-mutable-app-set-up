#!/bin/bash

LOG=/opt/user-data-$$.log
yum install python39-devel -y &>>$LOG
pip3.9 install ansible botocore boto3 &>>$LOG

ansible-pull -i localhost, -U https://github.com/sumayya-005/roboshop-ansible roboshop.yml -e ROLE_NAME=${COMPONENT} -e ENV=${ENV} &>>$LOG


#This is going to give application content we need for the app setup.