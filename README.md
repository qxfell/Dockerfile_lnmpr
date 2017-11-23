#使用Dockerfile 构建lnmp+redis容器

#安装docker-ce（社区版）<br> 
  yum install -y yum-utils device-mapper-persistent-data lvm2    //安装依赖 <br> 
  yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo  //安装yum源 <br> 
  yum -y install docker-ce    //安装docker-ce  <br> 
  systemctl start docker.service   //启动docker <br> 
  systemctl enable docker.service    // 设置开机自启 <br> 

  #docker 国内镜像加速：<br> 
vim /etc/docker/daemon  <br> 

{ <br> 
  "registry-mirrors": ["https://registry.docker-cn.com"] <br> 
} <br> 


#目录结构：<br> 

├── mysql <br> 
│   ├── Dockerfile <br> 
│   └── my.cnf <br> 
├── nginx <br> 
│   ├── Dockerfile <br> 
│   ├── html <br> 
│   │   └── index.html <br> 
│   ├── nginx.conf <br> 
│   └── vhost <br> 
│       └── www.conf <br> 
├── php <br> 
│   ├── composer.phar <br> 
│   ├── Dockerfile <br> 
│   ├── php-7.1.3.tar <br> 
│   └── redis-3.1.3.tgz <br> 
└── redis <br> 
		├── Dockerfile <br> 
		└── redis.conf <br> 
	
	#构建镜像
	docker build -t nginx:v1 ./nginx
	docker build -t php:v1 ./php	
	docker build -t mysql:v1 ./mysql
	docker build -t redis:v1 ./redis
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
