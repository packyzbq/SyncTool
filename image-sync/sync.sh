#!/bin/sh
TARGET_REPO=$TARGET_REPO:-
for image in `cat images_list`
do
    echo " start sync image $line"
    docker pull $line
    docker tag $line registry.cn-hangzhou.aliyuncs.com/packyzbq/public:${line/:/-}
    docker push registry.cn-hangzhou.aliyuncs.com/packyzbq/public:${line/:/-}
done