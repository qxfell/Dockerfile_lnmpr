FROM alpine:3.8
MAINTAINER Author xfell96@163.com

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    apk --update add  wget bash curl bind-tools nginx && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN mkdir /run/nginx
RUN mkdir -p /usr/share/nginx/html
COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
RUN echo "ok" >/usr/share/nginx/html/index.html

EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
