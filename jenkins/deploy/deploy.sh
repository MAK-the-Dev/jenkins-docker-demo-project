#!/bin/bash

echo docker-demo-angular > /tmp/.auth
echo docker-demo-dotnetcore > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i ~/.ssh/productionServer /tmp/.auth azureprouser@23.99.131.221:/tmp/.auth
scp -i ~/.ssh/productionServer ./jenkins/deploy/publish azureprouser@23.99.131.221:/tmp/publish
ssh -i ~/.ssh/productionServer azureprouser@23.99.131.221 "/tmp/publish"
