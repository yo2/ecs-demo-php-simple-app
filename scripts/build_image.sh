#!/bin/bash
echo "Creating the image" >> /var/log/kops.log
REPOSITORY_URI=`cat /opt/k8s/ecr.txt`
REPO=$(echo "${REPOSITORY_URI}" |awk -F"/" '{ print $2 }')
echo "Repository = $REPO" >> /var/log/kops.log
echo "$REPOSITORY_URI" >> /var/log/kops.log
$(aws ecr get-login --no-include-email --region ap-southeast-2)
TAG=`date "+%d%H%M%S"`
IMAGE_URI="${REPOSITORY_URI}:${TAG}"
echo "$IMAGE_URI" >> /var/log/kops.log
echo $(grep "background-color" /root/src/index.php) >> /var/log/kops.log
echo "$(which docker)" &>> /var/log/kops.log
echo "$(sudo docker build -t $REPO . )" &>> /var/log/kops.log
echo "$(sudo docker tag $REPO:latest $IMAGE_URI)" &>> /var/log/kops.log
echo "$(sudo docker push $IMAGE_URI)"  &>> /var/log/kops.log
echo "$(sudo docker image ls $IMAGE_URI)" &>> /var/log/kops.log
echo "$(sudo kubectl set image deployment/website1 website1=$IMAGE_URI)" &>> /var/log/kops.log
