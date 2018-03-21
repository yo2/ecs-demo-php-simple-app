#!/bin/bash
echo "Changing perms............" >>/var/log/kops.log
chmod 755 /opt/k8s/codedeploy/build_image.sh