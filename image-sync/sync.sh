#!/bin/sh
TARGET_REPO=${TARGET_REPO:-"registry.cn-hangzhou.aliyuncs.com/packyzbq/public"}
for image in `cat images_list`
do
    echo " start sync image $line"
    docker pull $line
    docker tag $line ${TARGET_REPO}:${line/:/-}
    docker push ${TARGET_REPO}:${line/:/-}
done