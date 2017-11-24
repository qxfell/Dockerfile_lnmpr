FROM centos:6
MAINTAINER AT < xfell96@163.com >

ENV TZ "Asia/Shanghai"

RUN yum install -y wget gcc gcc-c++ automake pcre pcre-devel zlip zlib-devel openssl openssl-devel gd-devel libxml2-devel libmcrypt-devel epel-re
lease && \
    yum clean all

#Nginx
RUN cd /tmp && \
  wget http://nginx.org/download/nginx-1.12.1.tar.gz && \
  tar xzf nginx-1.12.1.tar.gz && \
  useradd -M -s /sbin/nologin nginx && \
  cd /tmp/nginx-1.12.1 && \
  ./configure \
    --prefix=/usr/local/nginx \
    --with-http_ssl_module --with-http_sub_module --with-http_dav_module --with-http_flv_module \
    --with-http_gzip_static_module --with-http_stub_status_module --with-debug && \
    make && \
    make install && \
    rm -rf /tmp/nginx-1.12.1.tar.gz && \
    rm -rf /tmp/nginx-1.12.1

ADD nginx.conf /usr/local/nginx/conf/nginx.conf
ADD vhost/* /usr/local/nginx/conf/vhost/


EXPOSE 80 443
#启动nginx
ENTRYPOINT ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]