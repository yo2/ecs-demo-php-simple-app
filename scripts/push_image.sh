#!/bin/sh
$(aws ecr get-login --no-include-email --region ap-southeast-2)
sudo docker build -t hod2 . 