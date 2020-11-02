#!/bin/sh
TARGET_REPO=${TARGET_REPO:-"registry.cn-hangzhou.aliyuncs.com/packyzbq/public"}
for line in `cat image-sync/images_list`
do
    echo " start sync image $line"
    docker pull $line
    docker login -u $ACS_USERNAME -p $ACS_PASSWORD
    docker tag $line ${TARGET_REPO}:${line/:/-}
    docker push ${TARGET_REPO}:${line/:/-}
done
