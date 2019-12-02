#!/bin/bash

echo docker-demo-angular > /tmp/.auth
echo docker-demo-dotnetcore > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i ~/.ssh/for_jenkins_to_access_prod /tmp/.auth azureprouser@23.99.131.221:/tmp/.auth
scp -i ~/.ssh/for_jenkins_to_access_prod ./jenkins/deploy/publish azureprouser@23.99.131.221:/tmp/publish
ssh -i ~/.ssh/for_jenkins_to_access_prod azureprouser@23.99.131.221 "/tmp/publish"
