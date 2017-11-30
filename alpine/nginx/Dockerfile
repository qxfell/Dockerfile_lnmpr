FROM alpine:3.6
MAINTAINER xfell96@163.com 

ENV TZ "Asia/Shanghai"

# 软件包安装
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.6/main/" >/etc/apk/repositories
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.6/community/" >>/etc/apk/repositories
RUN apk update
RUN apk add nginx

RUN mkdir /run/nginx
RUN mkdir -p /usr/share/nginx/html

# 端口号配置
EXPOSE 80

# 容器命令执行
ENTRYPOINT ["nginx", "-g", "daemon off;"]
