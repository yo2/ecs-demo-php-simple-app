#!/bin/bash
echo "codebuild images.json = `cat images.json`"  &>> /var/log/kops.log
IMAGE_URI=$(cat images.json | jq .[0]."imageUri" | sed 's/"//g')
echo "Image URI = $IMAGE_URI" &>> /var/log/kops.log
echo "$(sudo /usr/local/sbin/kubectl set image deployment/website1 website1=$IMAGE_URI)" &>> /var/log/kops.log