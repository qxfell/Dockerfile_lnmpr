FROM alpine:3.8
MAINTAINER www.hiseth.cn

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && \
    addgroup -g 499 -S nginx && \
    adduser -HDu 499 -s /sbin/nologin -g 'web server' -G nginx nginx && \
    apk --update --no-cache add curl geoip geoip-dev pcre libxslt gd openssl-dev pcre-dev zlib-dev pcre build-base linux-headers libxslt-dev gd-dev openssl-dev libstdc++ libgcc patch logrotate supervisor inotify-tools && \
    curl -sO http://nginx.org/download/nginx-1.18.0.tar.gz && \
    tar xf nginx-1.18.0.tar.gz && \
    rm -rf nginx-1.18.0.tar.gz

RUN cd /nginx-1.18.0 && \
    ./configure \
    --prefix=/usr/local/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --user=nginx \
    --group=nginx \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --with-http_ssl_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_gunzip_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_auth_request_module \
    --with-pcre \
    --with-mail  \
    --with-mail_ssl_module  \
    --with-http_v2_module \
    --with-http_stub_status_module \
    --with-http_gzip_static_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --http-client-body-temp-path=/var/tmp/nginx/client \
    --http-proxy-temp-path=/var/tmp/nginx/proxy \
    --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
    --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
    && make  \
    && make install  \
    && mkdir -p /var/tmp/nginx/{client,fastcgi,proxy,uwsgi}  \
    && mkdir -p /etc/nginx/cert  \
    && rm -rf /var/cache/apk/*


ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD proxy.conf /etc/nginx/conf.d/proxy.conf


ENV PATH /usr/local/nginx/sbin:$PATH
EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
