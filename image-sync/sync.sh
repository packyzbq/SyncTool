#!/bin/sh
TARGET_REPO=${TARGET_REPO:-"registry.cn-hangzhou.aliyuncs.com"}
NAMESPACE=${NAMESPACE:-"packyzbq"}
for line in `cat image-sync/images_list`
do
    echo " start sync image $line"
    docker pull $line
    docker login -u $ACS_USERNAME -p $ACS_PASSWORD registry.cn-hangzhou.aliyuncs.com
    docker tag $line ${TARGET_REPO}/${NAMESPACE}/$line
    docker push ${TARGET_REPO}/${NAMESPACE}/$line
done
