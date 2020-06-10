a标题虽然是python笔试题，但是内容，是python笔试题中出现的linux题目

作为一个后端开发，需要掌握的Linux功底

```
linux考试题
1.在登录Linux时，一个具有唯一进程ID号的shell将被调用，这个ID是什么()
A.NID B.PID C.UID C.CID
B
2.下面那个用户存放用户密码信息()
A./boot B./etc C./var D./dev
B
3.用于自动补全功能时，输入命令或文件的前1个或后几个字母按什么键()
A.ctrl B.tab C.alt D.esc
B
4.vim退出不保存的命令是()
A.:q B.q C.:wq D.:q!
D
5.文件权限读、写、执行三种符号的标志依次是()
A.rwx B.xrw C.rdx D.rws
A
6.某文件的组外成员的权限是只读、属主是全部权限、组内权限是可读可写、该文件权限为()
A.467 B.674 C.476 D.764
D
7.改变文件的属主的命令是()
A.chmod B.touch C.chown D.cat
C
8.解压缩文件mydjango.tar.gz，我们可以用()
A.tar -zxvf mydjango.tar.gz
B.tar -xvz mydjango.tar.gz
C.tar -czf mydjango.tar.gz
D.tar - xvf mydjango.tar.gz
A
9.检查linux是否安装了,可用哪些命令()
A.rpm -ivh nginx
B.rpm -q nginx
C.rpm -U nginx
D.rpm -x nginx
B
10.Linux配置文件一般放在什么目录()
A.etc B.bin C.lib D.dev
A
11.linux中查看内存，交换内存的情况命令是()
A.top B.last c.free D.lastcomm
C
12.观察系统动态进程的命令是()
A.free B.top C.lastcomm D.df
B
13.如果执行命令，chmod 746 file.txt ，那么该文件的权限是()
A.rwxr—rw-
B.rw-r—r—
C.—xr—rwx
D.rwxr—r—
A
14.找出当前目录以及其子目录所有扩展名为”.txt”的文件，那么命令是()
A.ls .txt
B.find /opt -name “.txt”
C.ls -d .txt
d.find -name “.txt”
D
15.什么命令常用于检测网络主机是否可达?
A.ssh B.netstat C.ping D.exit
C
16.退出交互式shell，应该输入什么?
A:q! B.quit C.; D.exit
D
17.在父目录不存在的时候，添加的参数是?
A.-P B.-d C.-f D.-p
D
18.下列文件中，包含了主机名到IP地址映射关系的文件是?
A./etc/hostname
B./etc/hosts
C./etc/resolv.conf
D./etc/networks
B
19.请问你使用的linux发行版是什么？如何查看linux发行版信息？
cat /etc/redhat-release
20.Linux单引号双引号的区别?
单引号:内容就是一个字符串,不会识别任何其他特殊符号
双引号:是能够识别特殊符号的,以及变量
21.vim有几种工作模式
四种：正常，命令，插入，可视
22.nginx的主配置文件是?如何实现多虚拟主机?nginx反向代理参数是？
conf/nginx.conf 
在配置文件中添加多个server代码块 修改里面的端口号
23.sed命令截取出ip地址

24.如何解压缩后缀是.tar.gz文件?
tar -zxvf  .tar.gz
25.awk命令截取出ip地址

26.www服务在internet最为广泛，采用的结构是?
B/S
27.如何给linux添加dns服务器记录?
vim  /etc/resolv.conf  #

28.每月的5,15,25的晚上5点50重启nginx
50 17 5,15,25 * *  /usr/bin/systemctl  restart nginx (命令的绝对路径)
29.每分钟清空/tmp/内容
* * * * *  /usr/bin/rm  -rf  /tmp/*
30.每天早上6.30清空/tmp/的内容
30 6 * * *  /usr/bin/rm  -rf  /tmp/*
31.每个星期三的下午6点和8点的第5到15分钟之间备份mysql数据到/opt/
5-15 6,8 * * 3 /usr/bin/cp -r  /var/lib/mysql  /opt/
32.某文件权限是drw-r—rw-，请解读该权限？
属主user:读写
组group:只读
其他人outhor:读写
33.centos版本系统服务管理命令是?
systemctl
34.如何远程登录阿里云123.206.16.61?
ssh root@123.206.16.61
35.备份mariadb的命令是?
mv mariadb new_mariadb
mysql|dump -uroot -p
36.简述特殊符号的含义?

# 注释	
. 当前目录
.. 当前目录的上一级目录
$PATH 查看PATH路径
37.如果你发现在公司无法使用rm，使用提示’禁止你使用rm’,是为什么？
权限不够
38.如何修改test.py属组为alex?
chgrp   alex  test.txt
39.如何在windows和linux传输文件？有哪些方法？
lrzsz           xftp        
40.如何杀死mariad进程?
pkill -9 mariad(pkill后面跟名字)
kill -9 mariad的进程号(kill后面跟进程号)
41.登录一台Linux之后，使用yum命令提示command not found，怎么办?
yum没有下载
42.linux如何安装软件?有几种方式？
yum  rpm   源码包
43.出于安全角度，简述如何安装启动redis服务端？
yum install redis -y
systemctl  start redis 
redis-cli
----
更改端口
开启protommode yes
设置redis密码
redis-sever redis.conf
44.如何保证本地测试环境和线上开发环境一致性？思路?

45.virtualenv是什么?简述如何使用
virtualenv是用来为一个应用创建一套运行环境(例如:python)
pip3 install virtualenv
virtualenv --no-site-packages --python=python3 env1
source /opt/目录/bin/activate  激活虚拟环境
46.virtulevnwrapper是什么？简述使用
virtaulenvwrapper是virtualenv的扩展包,方便管理虚拟环境
安装虚拟环境        pip3 install virtualenvwrapper
创建并进入虚拟环境   mkvirtualenv  env1
切换虚拟环境        workon  虚拟环境名
47.redis哨兵是什么？作用是

48.redis-cluster是什么?

49.什么是静态资源，什么是动态资源？
静态资源:网站的CSS/JS/HTML文件
动态资源:一般是指数据,是后端给前端提供的数据
50.配置linux软连接的命令?
ln -s 目标文件名  软连接名
51.如何永久添加/opt/python36/的环境变量？
vim /etc/profile
添加PATH="/opt/python36/:"
source /etc/profile
52.给如下代码添加注释
server{                  --->  一个虚拟主机
listen 80;               --->  监听的端口,访问的端口是80
server_name 192.168.11.11; ---> 访问的域名192.168.11.11
location / {             --->  访问的路径
root html;               --->  指定页面的目录
index index.html;        --->  指定的网页
}
}

server{                 --->虚拟主机
listen 8080;            --->nginx的监听端口
server_name 192.168.11.11;  --->nginx访问域名
location / {                --->location匹配url
include uwsgi_params;       ---> 将uwsgi参数添加进nginx
uwsgi_pass 0.0.0.0:8000;    --->反向代理转发请求给uwsgi
}
}

53.supervisor是什么？如何使用?
supervisor  是指在进程不经意间关闭后，可以自动启动进程保持正常运行
1.yum install supervisor
2.echo_supervisord_conf  >  /etc/supervisor.conf  #生成配置文件
3.vim  写入自定义的配置
[program:crm];  -->项目的名字
command = uwsgi的绝对路径 --ini  uwsgi.ini的绝对命令;  #启动项目的命令
stopasgroup = true; #默认为false,进城被杀死时,是否向这个进程组发送stop信号,包括子进程
killasgroup = true;  #默认为false,向进程组发送kill信号包括子进程
54.简述项目部署流程？如何部署路飞，uwsgi+nginx+supervisor+nginx

55.docker是什么？简述docker优势

56.你常用的docker常用命令有哪些？操作镜像、容器、仓库的命令

57.哪个命令无法查看linux文件内容？
A.tac B.more C.head D.man
D
58.使用rm -i 系统会提示什么信息？
A.命令所有参数
B.是否真的删除
C.是否有写的权限
D.文件的路径
B
59.为何说rm -rf 慎用？
强制删除所有内容

a60.python操作linux的模块是?
os
61.如果端口8080被占用，如何查看是什么进程？
netstat  -tunlp | grep 8080
62.redis是如何做持久化的?

63.redis集群了解过么？sentinal和cluster区别是什么
Redis Sentinal着眼于高可用，在master宕机时会自动将slave提升为master，继续提供服务。
Redis Cluster着眼于扩展性，在单个redis内存不足时，使用Cluster进行分片存储。

64.创建mysql用户alex，并且授予权限select权限，命令是什么？
grant select on . to alex@'%';
65.nginx如何实现负载均衡?
upstream  名字{
server  ip:端口   weight=权重数
server  ip:端口   weight=权重数
}

66.nginx的负载均衡调度算法有几种？是什么?
轮询机制    按时间顺序逐一分配到不同的后端服务器
weight     加权轮询,weight值越大,分配到的访问几缕越高
ip_hash    每个请求按照访问ip的hash结果分配 ,这样来自统一IP的固定访问一个后端服务器
url_hash   按照访问URL的hash结果来分配请求,是每个URL定向到同一个后端服务器
least_conn  最少链接数,哪个机器链接少就分发
67.linux下载软件包的方法有?
wget url地址
curl 也是发起http请求的命令
68.windows和linux常用远程连接工具有哪些?
xshell
putty
securecrt
69.如何给与一个脚本可执行权限
chmod u+x file
70.过滤出settings.py中所有的空白和注释行
grep   -v "^#"    settings.py |grep   -v "^$" 
71.过滤出file1中以abc结尾的行
grep "sbc$"  file1
72.容器退出后，通过docker ps查看不到，数据会丢吗?

73.如何批量清理后台停止的容器

74.如何查看容器日志?

75.服务器被攻击，吃光了所有的CPU资源，怎么办？禁止重装系统

76.绘制下python web部署图

77.在centos7.2中用一句话杀死所有的test.py进程
kill -9  test.py
78.在centos7.2中如何查看程序执行所消耗的cpu，内存等硬件信息
top
79.unix查询环境变量的命令是
echo $PATH
80.查询脚本定时任务的命令是
crontab  -l
81.saltstack、ansible、fabric、puppt工具的作用
批量管理远程服务器
82.uwsgi、wsgia是什么？
uwsgi是一种线路协议而不是通信协议,在此常用于uwsgi服务器与其他网络服务器的数据通信
而uwgsi是实现了uwsgi和wsgi两种协议的web服务器

wsgi  是web 服务器网关接口,他是一个协议,描述了web服务器如何与web应用程序通信,在线上,走的协议是nginx通过uwsgi_socket找到web应用程序uwsgi
83.supervisor是什么？
supervisor是守护进程的配置
84.解释PV,UV的含义？
pv page v
uv user v
85.解释QPS是什么？

86.解释什么是静态资源？动态资源？
静态资源:网站的CSS/JS/HTML文件
动态资源:一般是指数据,即后端给前端提供的数据
87.saltstack如何采集服务器静态数据？

88.请用yaml语法表示如下python数据结构
{
“老男孩”:[{“老师”:[“太白”,”女神”,”吴老板”]},{“学生”:[“20期佳增同学”]}]
}

89.redis怎么实现队列？

90.什么是docker生命周期？

91.docker容器有哪些状态？

92.dockerfile常用指令？

93.dockerfile中copy和add的区别

94.docker获取和删除镜像的命令?

95.如何退出一个交互式的容器终端，而不终止它？

96.容器如何端口映射？数据卷映射？

97.如何进入容器？流程是？

98.简述docker使用流程

99.如何批量删除或停止容器?

100.nginx的access.log能够统计哪些信息？

101.容器都是默认后台运行，怎么查看容器日志？

102.容器退出后，通过docker ps 命令查看不到，数据会丢失么？
```

