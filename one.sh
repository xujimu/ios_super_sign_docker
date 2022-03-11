#!/bin/bash
do_main=你的域名
yum install epel-release -y
systemctl stop firewalld.service
systemctl disable firewalld.service
yum install nginx -y 

cp /sign/cert/cert.pem /sign/mode/cert/cert.pem 
cp /sign/cert/cert.key /sign/mode/cert/cert.key 


sed -i 's/替换域名/'$do_main'/' /sign/application-sign.yml

sed -i 's/替换域名/'$do_main'/' /sign/nginx.conf

rm -rf  /etc/nginx/nginx.conf 
mv /sign/nginx.conf  /etc/nginx
mv /sign/cert /etc/nginx
chmod -R 777 /etc/nginx/cert/*
mv /sign/application-sign.yml /opt
mv /sign/ios-super-sign-0.0.1-SNAPSHOT.jar /opt
mv /sign/two.sh /opt
mv /sign/restart.sh /opt


systemctl start nginx

systemctl enable nginx

chmod -R 777 /sign && yum install docker -y && systemctl start docker

systemctl start docker

systemctl enable docker

#docker login -u root -p root

docker pull 2524931333/centos7xjm:ssh

docker run -v /opt:/opt -v /var/lib/mysql/:/var/lib/mysql/ -v /sign:/sign  -p 8080:8080 -p 3306:3306 -p 8888:8888 -tdi --privileged --name sign -d --restart always 2524931333/centos7xjm:ssh init -t

systemctl restart nginx

docker exec -it sign /bin/bash


   


