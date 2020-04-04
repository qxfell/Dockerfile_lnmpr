### Dockerfile Example
```
FROM registry.cn-beijing.aliyuncs.com/qiangxianfei/alpine_tomcat:v2.0
LABEL maintainer="flynn <xfell96@163.com>"


ARG NAME
ARG DOC_PATH
RG NAME="jenkins"
ARG DOC_PATH="/${NAME}"
ENV VERSION=3.0.1

COPY ${NAME}.war /opt/apps/${NAME}/
RUN cd /opt/apps/${NAME} \
    && jar -xvf ${NAME}.war \
    && rm -rf ${NAME}.war

ENV JAVA_OPTS="-server -Xmx256m -Xms128m -Xmn64m"


RUN sed -i "/<\/Host>/i\<Context path=\"/${DOC_PATH}\" docBase=\"/opt/apps/${NAME}\" reloadable=\"false\" />" ${TOMCAT_HOME}/conf/server.xml

EXPOSE 8080
CMD [ "catalina.sh", "run" ]
ENTRYPOINT [ "entrypoint.sh" ]
```
