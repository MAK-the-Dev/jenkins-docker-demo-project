#!/bin/bash

echo docker-demo-angular > /tmp/.auth
echo docker-demo-dotnetcore > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod /tmp/.auth azureprouser@52.165.219.83:/tmp/.auth
scp -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod ./jenkins/deploy/publish azureprouser@52.165.219.83:/tmp/publish
ssh -i /var/lib/jenkins/workspace/ssh/for_jenkins_to_access_prod azureprouser@52.165.219.83 "chmod +x /tmp/publish | /tmp/publish"
