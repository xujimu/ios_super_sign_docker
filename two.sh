#!/bin/bash
mv /sign/sign.service /usr/lib/systemd/system
systemctl daemon-reload
systemctl restart mysqld
defaultmysqlpwd=`grep 'A temporary password' /var/log/mysqld.log | awk -F"root@localhost: " '{ print $2}' `
mysql --connect-expired-password  -uroot -p${defaultmysqlpwd} <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Mysql666..';
use mysql;
update user set host="%" where user="root";
EOF
systemctl restart mysqld 
mysql --connect-expired-password  -uroot -pMysql666.. <<EOF


create database ios_super_sign;
use ios_super_sign;
set names utf8mb4;
source /sign/mode/ios_super_sign.sql;
insert into user() values(null,'admin','admin',now(),1,0);


EOF
cd /opt
systemctl start redis 
systemctl enable mysqld
systemctl enable redis
systemctl start sign
systemctl enable sign