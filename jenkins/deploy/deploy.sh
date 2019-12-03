#!/bin/bash

IMG_A="docker-demo-angular"
IMG_B="docker-demo-dotnetcore"

echo "" > /tmp/.auth
echo $IMG_A >> /tmp/.auth
echo $IMG_B >> /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod /tmp/.auth azureprouser@52.165.219.83:/tmp/.auth
scp -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod ./jenkins/deploy/publish azureprouser@52.165.219.83:/tmp/publish
ssh -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod azureprouser@52.165.219.83 "chmod +x /tmp/publish && sh /tmp/publish"
