#!/bin/sh
TARGET_REPO=${TARGET_REPO:-"registry.cn-hangzhou.aliyuncs.com"}
NAMESPACE=${NAMESPACE:-"packyzbq"}
for line in `cat image-sync/images_list`
do
    if [[ ${line:0:1} != "#" ]]
    then
        arr=(${line//@/ })
        image=${arr[0]}
        if [[ ${#arr[@]} -eq 2 ]]
        then
            extra_args="$extra_args --platform ${arr[1]}"
        fi
        echo " start sync image $image"
        docker pull $line
        docker login -u $ACS_USERNAME -p $ACS_PASSWORD registry.cn-hangzhou.aliyuncs.com
        docker tag $image ${TARGET_REPO}/${NAMESPACE}/$image
        docker push ${TARGET_REPO}/${NAMESPACE}/$image
    fi
done
