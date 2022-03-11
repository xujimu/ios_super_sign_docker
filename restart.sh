#!/bin/bash
ids=`ps -ef | grep "ios-super-sign-0.0.1-SNAPSHOT.jar" | grep -v "grep" | awk '{print $2}'`
echo "当前服务id:" $ids


for id in $ids
do
    kill -9 $id
    echo "killed $id"  
done

nohup /usr/bin/java -jar /opt/ios-super-sign-0.0.1-SNAPSHOT.jar  --spring.config.location=/opt/application-sign.yml > /opt/my.log 2>&1 &