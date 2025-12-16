#!/bin/bash

function installSystemManagerAgentOnEc2(){
   apt-get update -y

    if [ ! -d "/tmp/ssm" ]; then
        mkdir -p /tmp/ssm
    fi
   
    cd /tmp/ssm

    if [ ! -d "amazon-ssm-agent.deb" ]; then
        wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
    fi
    
    dpkg -i amazon-ssm-agent.deb
    
    systemctl stop amazon-ssm-agent
    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent
} 

installSystemManagerAgentOnEc2

