## ios_super_sign

###### 超级签名 免签封装 安卓打包 企业签名 自助分发多合一系统 超级签名MDM 企业签名MDM

### 主要功能

1. 基本操作

   - 修改密码
   - 用户信息
   - 共有池
   - 退出

2. 超级签名

   - 应用列表

     - 应用信息

     - 安卓合并
     - 简介编辑
     - 轮播图编辑
     - 分发地址复制
     - 下载码启动
     - 下载码购买地址
     - 删除

   - 上传应用

     - 拖动ipa上传

   - 下载密码

     - 下载码生成
     - 下载码信息显示
     - 删除

3. 证书管理

   - 证书列表
     - 证书信息
     - 剩余设备数
     - 删除
   - 上传证书
     - p8模式证书上传

4. 用户管理

   - 用户列表
     - 用户信息
     - 添加共有池

5. 下载管理

   - 下载记录
   - 对应设备签名的证书下载

6. 免签封装

   - 打包支持自定义信息
     - 应用名称
     - 打包网址
     - 描述文件名称
     - 描述文件机构
     - 描述文件描述信息
     - 描述文件统一信息
     - 应用图标
     - 启动图(仅支持安卓)
     - 苹果图标是否可删除
     - 安卓动态网址
     - 安卓包名
     - 版本
     - 自定义描述文件绿标证书
   - 打包记录
     - 分发地址
     - 分发源码下载地址

7. 企业签名

   - 开始签名
     - 开始签名
     - 编辑签名证书所需共有池
     - 删除
     - 证书备注修改
   - 签名记录
     - 签名记录信息
     - 签名后的ipa包下载
   - 上传证书

8. 自助分发

   - 开始分发
   - 分发记录
     - 分发记录显示
     - 安卓合并更新
     - 苹果更新
     - 简介编辑
     - 分发地址复制
     - 删除
9. 超级签名MDM
10. 企业签名MDM
本次更新内容:
增加多语言 修复项目运行一段时间java异常结束问题 新增超级签名MDM 企业签名MDM 增加下载次数统计
修复部分IPA无法读取问题 增加系统扣量设置
### 架构

---

- 后端 spring boot
- 前端 vue
- 数据库 mysql
- redis
- 其他 redis python openssl androidsdk python unzip java8 java11 zsign

### 部署

**安装**
自2022年5月6日起步 支持宝塔搭建 

两个域名 主域名和mdm域名 一个装有宝塔的服务器
1.上宝塔添加站点配置两个域名的https
2.设置域名的反向代理 主域名反向代理端口10802 mdm域名端口10802
3.设置nginx上传文件最大值

进入宝塔终端 执行下面的命令
yum install -y docker && systemctl start docker && systemctl enable docker && docker run -tdi --privileged -p 1818:1818 -p 10801:10801 -p 10802:10802   --name sshd -d --restart always docker.io/2524931333/centos7ssh:demo init && docker exec sshd /bin/sh /opt/restart.sh

完成后进入网站 注册一个账号 默认第一个账号就是管理员账号
登录后 进入系统设置 修改主域名和mdm域名 即可正常使用

安装视频: https://www.bilibili.com/video/BV1UB4y117N2#reply111920410592

项目开源地址: https://github.com/xujimu/ios_super_sign

本项目只允许个人使用 方便ios开发 不得用于违法犯罪行为 否则作者不承担任何法律以及连带责任 

推荐服务器阿里云 购买链接
https://www.aliyun.com/daily-act/ecs/activity_selection?userCode=igu2cmo4

### 鸣谢
https://github.com/zhlynn/zsign

### 演示站

https://test.wlznsb.cn
账号密码都是super


