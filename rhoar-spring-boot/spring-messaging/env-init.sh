#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

PROJECT=spring-messaging
UI_PATH=/root/code

git clone -q https://github.com/GetLevvel/rhoar-sample-code.git
cd ${UI_PATH} && cp -R /root/rhoar-sample-code/${PROJECT}/* ./
clear # To clean up Katacoda terminal noise
~/.launch.sh