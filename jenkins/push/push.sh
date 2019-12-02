#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE_A="docker-demo-angular"
IMAGE_B="docker-demo-dotnetcore"

echo "** Logging in ***"
docker login -u mak4dev -p $PASS
echo "*** Tagging ng image ***"
docker tag $IMAGE_A:$BUILD_TAG mak4dev/$IMAGE_A:$BUILD_TAG
echo "*** Pushing ng image ***"
docker push mak4dev/$IMAGE_A:$BUILD_TAG
echo "*** Tagging dotnet image ***"
docker tag $IMAGE_B:$BUILD_TAG mak4dev/$IMAGE_B:$BUILD_TAG
echo "*** Pushing dotnet image ***"
docker push mak4dev/$IMAGE_B:$BUILD_TAG


