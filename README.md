#Dockerfile 

	#安装docker-ce（社区版）
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



	
	
	
	
	
	
	
	
	
	
	
	
	
	
