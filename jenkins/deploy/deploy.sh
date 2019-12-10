#!/bin/bash

IMG_A="docker-demo-angular"
IMG_B="docker-demo-dotnetcore"


echo $IMG_A > /tmp/.auth
echo $IMG_B >> /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod /tmp/.auth azureprouser@vmpro.centralus.cloudapp.azure.com:/tmp/.auth
scp -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod ./jenkins/deploy/publish azureprouser@vmpro.centralus.cloudapp.azure.com:/tmp/publish
ssh -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod azureprouser@vmpro.centralus.cloudapp.azure.com "chmod +x /tmp/publish && sh /tmp/publish"
