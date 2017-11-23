#使用Dockerfile 构建lnmp+redis容器

安装docker-ce（社区版）
  yum install -y yum-utils device-mapper-persistent-data lvm2    //安装依赖
  yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo  //安装yum源
  yum -y install docker-ce    //安装docker-ce 
  systemctl start docker.service   //启动docker
  systemctl enable docker.service    // 设置开机自启

  #docker 国内镜像加速：
vim /etc/docker/daemon  

{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}


目录结构：
.
├── mysql
│   ├── Dockerfile
│   └── my.cnf
├── nginx
│   ├── Dockerfile
│   ├── html
│   │   └── index.html
│   ├── nginx.conf
│   └── vhost
│       └── www.conf
├── php
│   ├── composer.phar
│   ├── Dockerfile
│   ├── php-7.1.3.tar
│   └── redis-3.1.3.tgz
└── redis
    ├── Dockerfile
    └── redis.conf
	
	#构建镜像
	docker build -t nginx:v1 ./nginx
	docker build -t php:v1 ./php	
	docker build -t mysql:v1 ./mysql
	docker build -t redis:v1 ./redis
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	