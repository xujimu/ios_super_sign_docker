#!/bin/bash
yum install epel-release -y
systemctl stop firewalld.service
systemctl disable firewalld.service
yum install nginx -y 
rm -rf  /etc/nginx/nginx.conf 
mv /sign/nginx.conf  /etc/nginx
mv /sign/cert /etc/nginx
chmod -R 777 /etc/nginx/cert/*
mv /sign/application-sign.yml /opt
mv /sign/ios-super-sign-0.0.1-SNAPSHOT.jar /opt
mv /sign/two.sh /opt

systemctl start nginx

chmod -R 777 /sign && yum install docker -y && systemctl start docker

#docker login -u root -p root

docker pull 2524931333/centos7xjm:ssh

docker run -v /opt:/opt -v /var/lib/mysql/:/var/lib/mysql/ -v /sign:/sign  -p 8080:8080 -p 3306:3306 -p 8888:8888 -tdi --privileged --name sign -d --restart always 2524931333/centos7xjm:ssh init -t

systemctl restart nginx

docker exec -it sign /bin/bash


   


