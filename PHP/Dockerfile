FROM centos:6
MAINTAINER AT < xfell96@163.com >

ENV TZ "Asia/Shanghai"
ENV TZ PATH=$PATH:/usr/local/php/bin

COPY php-7.1.3.tar /tmp
COPY redis-3.1.3.tgz /tmp

RUN yum -y install bzip2 gcc gcc-c++ libxslt-devel* libxml2-devel openssl-devel bzip2-devel curl-devel libjpeg-devel libpng-devel libXpm-devel fr
eetype-devel gmp-devel libmcrypt-devel mysql-devel aspell-devel recode-devel m4 autoconf && \
    yum clean all && \
    cd /tmp && \
    tar xvf php-7.1.3.tar && cd php-7.1.3  && \
        ./configure \
        --prefix=/usr/local/php  \
        --with-curl --with-freetype-dir --with-gd --with-gettext --with-iconv-dir --with-kerberos --with-libdir=lib64 --with-libxml-dir --with-my
sqli --with-openssl --with-pcre-regex --with-pdo-mysql --with-pdo-sqlite --with-pear --with-png-dir --with-xmlrpc --with-xsl --with-zlib --enable
-fpm --enable-bcmath --enable-libxml --enable-inline-optimization --enable-gd-native-ttf --enable-mbregex --enable-mbstring --enable-opcache --en
able-pcntl --enable-shmop --enable-soap --enable-sockets --enable-sysvsem --enable-xml --enable-zip && \
        make && \
        make install && \
        cp ./php.ini-production /usr/local/php/lib/php.ini && \
        cp ./php.ini-production /usr/local/php/etc/php.ini && \
        cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
        cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf && \
        cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm && \
        sed -i "s/127.0.0.1/0.0.0.0/" /usr/local/php/etc/php-fpm.d/www.conf && \
        chmod +x /etc/init.d/php-fpm && \
		rm -rf /tmp/php-7.1.3 && \
		rm -rf /tmp/php-7.1.3.tar && \
		cd /tmp && \
		tar xvf redis-3.1.3.tgz && \
		cd /tmp/redis-3.1.3/ && \
		/usr/local/php/bin/phpize && \
       	./configure --with-php-config=/usr/local/php/bin/php-config && \
		make && \
		make install && \
		echo "extension=redis.so" >>/usr/local/php/lib/php.ini && \
		rm -rf /tmp/redis-3.1.3 && \
		rm -rf /tmp/redis-3.1.3.tgz
	
ADD 	composer.phar /usr/local/bin/composer 
RUN 	chmod 755 /usr/local/bin/composer
        cd /tmp && \
        tar xvf redis-3.1.3.tgz && \
        cd /tmp/redis-3.1.3/ && \
        /usr/local/php/bin/phpize && \
        ./configure --with-php-config=/usr/local/php/bin/php-config && \
        make && \
        make install

ADD     composer.phar /usr/local/bin/composer
RUN     chmod 755 /usr/local/bin/composer

EXPOSE 9000

#启动php
CMD /etc/init.d/php-fpm start && tail -F /var/log/messages
