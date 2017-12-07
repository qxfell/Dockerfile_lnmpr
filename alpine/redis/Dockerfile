FROM alpine:3.6
MAINTAINER AT xfell96@163.com

ENV TIMEZONE "Asia/Shanghai"
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.6/main/" >/etc/apk/repositories
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.6/community/" >>/etc/apk/repositories
RUN apk update

RUN apk add redis
RUN sed -i '/bind 127.0.0.1/s/bind 127.0.0.1/#bind 127.0.0.1/g' /etc/redis.conf
RUN sed -i 's/daemonize yes/daemonize no/g' /etc/redis.conf
RUN sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf

EXPOSE 6379

CMD ["redis-server","/etc/redis.conf"]
