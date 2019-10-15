# weather_Station_SSM
  一个可供开发者二次开发的基于SSM框架的气象数据监测平台
### 基于SSM的气象站监测平台的实现

#### 预览地址

预览请点击[气象数据监测平台](http://47.94.136.182:8080/weather_Station_SSM_war),默认用户名为<font color="red">admin</font>,密码为<font color="red">123456</font>。

#### 项目简介

​	本次项目主要是基于SSM框架实现的简单气象站平台的数据监测系统框架（<font style="color:red;"><u>注意是框架哦!</u></font>），主要用到了[bootstrap](https://www.bootcss.com/)前端技术以及[highcharts](https://www.highcharts.com.cn/)可视化技术。

​	其中本次系统演示是监测的数据只是系统随机生成的，具体实时数据要通过开发者自己编写获取，下面会给出二次开发的教程！

#### 二次开发教程

##### 工程导入

​	下载项目之后使用idea导入maven工程，具体过程可参考[IDEA教程之导入maven项目-百度经验](https://jingyan.baidu.com/article/cbf0e5007484db2eaa28933a.html)，也可自行百度。

##### 项目架构

```
|-- .idea                      本地idea工程配置信息
|-- out            			  
    |-- artifacts              war包导出路径
|-- src                        
	|-- main
		|-- java              java文件  
		|-- cn.njut
			|-- controller    
			|-- dao           
			|-- domain
			|-- server
			|-- tcpclient
		|-- resources         资源文件
		|-- webapp            网页文件
|-- target			          编译文件
|-- weather_Station.sql        sql脚本文件
|-- pom.xml                    maven仓库配置文件
|-- External Libraries         依赖包
```

##### 开发思路

​	1、本次监测平台充当上位机，使用tcp协议获取硬件平台的数据，文件为TcpClient.java，当然也可充当服务器，可参考cn.njut.server包中的java文件；

​	2、找到cn.njut.controller包下的DataController.java文件，在DataController.java文件中的updateData方法中进行获取数据的解析；

​	3、tomcat部署；

​	4、导入weather_Station.sql脚本文件；

​	5、部署开启tomcat运行即可 
