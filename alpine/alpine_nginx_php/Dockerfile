#Mini Alpine Image Dockerfile For nginx_php :
FROM alpine:3.8
MAINTAINER Dictator xfell96@163.com


ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    apk --update add  wget bash curl ca-certificates tar iproute2 bind-tools tzdata && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone  


RUN apk add php7  \
        php7-fpm  \
        php7-opcache  \
        php7-session  \
        php7-xml  \
        php7-ctype  \
        php7-gd  \
        php7-json  \
        php7-posix  \
        php7-curl  \
        php7-dom  \
        php7-pdo  \
        php7-pdo_mysql  \
        php7-sockets  \
        php7-zlib  \
        php7-mcrypt  \
        php7-mysqli  \
        php7-sqlite3  \
        php7-bz2  \
        php7-phar  \
        php7-posix  \
        php7-zip  \
        php7-calendar  \
        php7-iconv  \
        php7-imap  \
        php7-soap  \
        php7-dev  \
        php7-pear  \
        php7-redis  \
        php7-mbstring  \
        php7-xdebug  \
        php7-exif  \
        php7-xsl  \
        php7-ldap  \
        php7-openssl  \
        php7-bcmath


# Download Composer
RUN php -r "readfile('http://install.phpcomposer.com/installer');" | php -- --install-dir=/bin/ --filename=composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
COPY .php/www.conf /etc/php7/php-fpm.conf
COPY .php/php-fpm.conf /etc/php7/php-fpm.conf

RUN chmod 777 -R /var/log/

# PHP7 ENV
ENV PHP_MEMORY_LIMIT 512M
ENV MAX_UPLOAD 50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV MAX_EXECUTION_TIME 600
ENV PHP_MAX_POST 100M

RUN sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php7/php.ini && \
	sed -i "s|upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|" /etc/php7/php.ini && \
	sed -i "s|max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|" /etc/php7/php.ini && \
	sed -i "s|max_execution_time =.*|max_execution_time = ${MAX_EXECUTION_TIME}|" /etc/php7/php.ini && \
	sed -i "s|post_max_size =.*|max_file_uploads = ${PHP_MAX_POST}|" /etc/php7/php.ini && \
	sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php7/php.ini && \
	sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php7/php.ini && \
	sed -i "s/display_errors = Off/display_errors = On/" /etc/php7/php.ini && \
	sed -i "s/;catch_workers_output = yes/catch_workers_output = yes/" /etc/php7/php-fpm.conf 
#   sed -i -e "s/listen\s*=\s*127.0.0.1:9000/listen = 9000/g" /etc/php7/php-fpm.d/www.conf && \



#Add nginx
RUN apk add --no-cache nginx
RUN mkdir /run/nginx
RUN mkdir -p /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
RUN echo "ok" >/usr/share/nginx/html/index.html
RUN echo "<?php phpinfo();" >/usr/share/nginx/html/test.php

# Add supervisor
RUN apk add supervisor \
	&& rm -rf /var/cache/apk/*


#Add crontab for laravel的任务调度
#COPY ./crontabs/default /var/spool/cron/crontabs/
#RUN cat /var/spool/cron/crontabs/default >> /var/spool/cron/crontabs/root
#RUN mkdir -p /var/log/cron \
#    && touch /var/log/cron/cron.log

#VOLUME /var/log/cron


								   
VOLUME ["/usr/share/nginx/html", "/var/log/php7", "/var/run/"]
WORKDIR /usr/share/nginx/html
								   
VOLUME ["/etc/supervisor/conf.d", "/var/log/supervisor/"]
COPY ./supervisord.conf /etc/supervisor/conf.d/

WORKDIR /usr/share/nginx/html
COPY ./entrypoint.sh /etc/nginx/entrypoint.sh
RUN chmod +x /etc/nginx/entrypoint.sh


EXPOSE 80
ENTRYPOINT ["/etc/nginx/entrypoint.sh"]
