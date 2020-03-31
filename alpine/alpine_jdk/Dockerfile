#Mini Alpine Image Dockerfile For java :
FROM alpine:3.8
MAINTAINER Dictator xfell96@163.com
ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    apk --update add  wget bash curl ca-certificates tar iproute2 bind-tools tzdata su-exec && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone  && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    curl -Ls https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk >/tmp/glibc-2.30-r0.apk && \
    curl -Ls https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-bin-2.30-r0.apk >/tmp/glibc-bin-2.30-r0.apk && \
    curl -Ls https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-i18n-2.30-r0.apk >/tmp/glibc-i18n-2.30-r0.apk && \
    apk add --allow-untrusted /tmp/glibc-2.30-r0.apk && \
    apk add --allow-untrusted /tmp/glibc-bin-2.30-r0.apk && \
    apk add --allow-untrusted /tmp/glibc-i18n-2.30-r0.apk && \
    /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 && \
    rm -rf /tmp/glibc-2.30-r0.apk && \
    rm -rf /tmp/glibc-bin-2.30-r0.apk && \
    rm -rf /tmp/glibc-i18n-2.30-r0.apk && \
    rm -rf /etc/apk/keys/sgerrand.rsa.pub && \
    rm -rf /var/cache/apk/* 
    
# JDK8
ENV JAVA_HOME=/usr/local/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
ENV PATH=.:${JAVA_HOME}/bin:$PATH

#ENV JAVA_HOME /usr/local/java
#ENV JRE_HOME ${JAVA_HOME}/jre
#ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
#ENV PATH ${JAVA_HOME}/bin:$PATH

RUN curl -Ls https://flynn-images.oss-cn-beijing.aliyuncs.com/jdk-8u131-linux-x6402.tar.gz >/tmp/jdk-8u131-linux-x64.tar.gz && \
    touch /tmp/1.txt && \
    tar xf /tmp/jdk-8u131-linux-x64.tar.gz  -C /usr/local && \
    mv /usr/local/jdk1.8.0_131 /usr/local/java && \
    rm -rf /usr/local/java/*src.zip \
           /usr/local/java/lib/missioncontrol \
           /usr/local/java/lib/visualvm \
           /usr/local/java/lib/*javafx* \
           /usr/local/java/jre/lib/plugin.jar \
           /usr/local/java/jre/lib/ext/jfxrt.jar \
           /usr/local/java/jre/bin/javaws \
           /usr/local/java/jre/lib/javaws.jar \
           /usr/local/java/jre/lib/desktop \
           /usr/local/java/jre/plugin \
           /usr/local/java/jre/lib/deploy* \
           /usr/local/java/jre/lib/*javafx* \
           /usr/local/java/jre/lib/*jfx* \
           /usr/local/java/jre/lib/amd64/libdecora_sse.so \
           /usr/local/java/jre/lib/amd64/libprism_*.so \
           /usr/local/java/jre/lib/amd64/libfxplugins.so \
           /usr/local/java/jre/lib/amd64/libglass.so \
           /usr/local/java/jre/lib/amd64/libgstreamer-lite.so \
           /usr/local/java/jre/lib/amd64/libjavafx*.so \
           /usr/local/java/jre/lib/amd64/libjfx*.so \
           rm -rf /tmp/jdk-8u131-linux-x64.tar.gz

CMD [ "tail", "-F" ,"/tmp/1.txt" ]
