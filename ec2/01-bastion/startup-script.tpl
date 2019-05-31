#!/bin/bash

# mount the block device on /var/lib/docker
mkfs -t ext4 /dev/xvdz
mkdir /var/lib/docker
mount /dev/xvdz /var/lib/docker
echo "/dev/xvdz /var/lib/docker ext4 defaults,nofail 0 2" >> /etc/fstab

# update linux
yum update -y

# set environment vars
export AWS_DEFAULT_REGION=eu-west-1

# install docker, create docker group to fix the number
# groupadd -g 497 docker
yum install docker -y
service docker start

# login hourly to ECR registry
echo "aws ecr --region=$AWS_DEFAULT_REGION get-login --no-include-email | bash" > /etc/cron.hourly/ecr-login
chmod +x /etc/cron.hourly/ecr-login
/etc/cron.hourly/ecr-login

# setup daily docker prune
echo "docker system prune -f" > /etc/cron.daily/docker-prune
chmod +x /etc/cron.daily/docker-prune
/etc/cron.daily/docker-prune

${docker_commands}
