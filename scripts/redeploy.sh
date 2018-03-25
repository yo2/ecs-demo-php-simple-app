#1/bin/bash
$IMAGE_URI=cat images.json | jq .[0]."imageUri" | sed 's/"//g'
echo "$(sudo kubectl set image deployment/website1 website1=$IMAGE_URI)" &>> /var/log/kops.log