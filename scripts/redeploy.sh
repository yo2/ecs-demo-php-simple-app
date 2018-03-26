#!/bin/bash
echo "Image URI = $1" &>> /var/log/kops.log
echo "$(sudo /usr/local/sbin/kubectl set image deployment/website1 website1=$1)" &>> /var/log/kops.log