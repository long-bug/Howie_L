1.默写常用命令与其意思

```

```

2.如何查看Linux的环境变量，路径以什么符号分割？如何修改PATH变量，以及永久修改PATH？

```
# echo $PATH
vim  /etc/profile #打开文件，在文件末尾，添加PATH值的修改
PATH="/opt/python36/bin/:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:"
```

![image-20200215163943511](F:\Python学习笔记\图片\image-20200215163943511.png)

3.反复练习绝对路径，相对路径

在/home/目录创建文件夹oldboy,进入oldboy创建helloLinux.txt
创建/tmp/chaogeLinux.txt，用绝对路径方式与相对路径两种方法
在/tmp/目录下创建chaogeDir目录

![image-20200215164345889](C:\Users\heyul\Desktop\image-20200215164345889.png)

4.解释 linux下 > >> 符号是什么意思?

```
>>	 #重定向输出 追加符  ，如同 a模式 
```

5.找到服务器上所有 以.txt结尾的普通文件

```
find  /    -name  "*.txt"
```

6.查看进程，并且过滤出有关python的进程

![image-20200215164428132](F:\Python学习笔记\图片\image-20200215164428132.png)

7.如何树状图显示django的项目文件内容

```
cd /diango
tree 
```

8.如何查看rm命令的详细使用信息？

```
man rm
```

9.读取/etc/passwd文件内容，写入到/tmp/pwd.txt文件中，（用两种方式）

```
 cp  /etc/passwd  /tmp/pwd.txt
 cat /etc/passwd  >> /tmp/pwd.txt
```

10.在linux编写二个socket脚本，能够运行一个服务端，一个客户端，能send，recv接收消息即可

```
server
#!coding:utf-8
from socket import socket
sk=socket()
sk.bind(("127.0.0.1",8088))
sk.listen(10)
conn,addr = sk.accept()
conn.send("hello")
print(conn.recv(1024))
conn.close()
sk.close()


client
#!coding:utf-8
from socket import socket
sk = socket()
sk.connect(("127.0.0.1,8088))
print(sk.recv(1024))
sk.send("youyouyo")
sk.close()

```

![image-20200215190856810](F:\Python学习笔记\图片\image-20200215190856810.png)

![image-20200215190908564](F:\Python学习笔记\图片\image-20200215190908564.png)

11.读取第十题的socket服务端脚本，且显示行号

```
cat server.py -n
```

12.拷贝/opt下所有的内容，放到/optbak文件夹下

```
cp -r /opt /optbak
```

13.给第十题的socket客户端脚本，改个名字

```
mv server.py Server.py
```

14.移动第十题的2个socket脚本，放入到/Learn_linux目录下

```
mkdir /Learn_linux
mv *.py /Learn_linux
```

15.给启动django的命令做一个简单的别名

```
python3 manage.py runserver 0.0.0.0:8000

alias run=python3 manage.py runserver 0.0.0.0:8000
```

16.搜索linux中所有超过100M的 压缩文件（后缀是*.gz）

```
find -type f -size +100M -name *.gz
```

17.搜索linux中名字有关django的文件夹

```
find -type d -name django
```

18.过滤出settings.py配置文件中的有益信息（非空，非注释行）

```
grep -v "^$" settings.py | grep -v"^#"
```

19.过滤出 /etc/passwd文件中有关root的行，注意大小写

```
grep -n "root" /etcpasswd
```

20.实时刷新文件/var/log/nginx/access.log日志的内容变化

```
tail -f /var/log/nginx/access.log
```

21.查看settings.py文件前10行

```
head -10 settings.py
```

22.查看/etc/passwd文件的 10~20行的内容

```
head -20 /etc/passwd | tail -11
```

23.传输本地的/tmp/pwd.txt到192.168.1.11服务器的/tmp目录

```
scp /tmp/pwd.txt root@192.168.1.11:/tmp/
```

24.如何在/home.python目录，执行/home/my_first.py文件?

```
python /home/my_first.py
```

25.向my_first.py文件中写入"Lift is short,I use python"

```
echo "Lift os short, I use python" >> my_first.py
```

26.找一下python命令在哪

```
which python
```

27.查看/var/log/文件大小

```
du /var/log/ -sh
```

28.如何查看服务器的负载信息？

```
top
```

29.如何查看服务器是否运行了mysql?有哪些验证方式

```
mysql -uroot -p
ps -ef | grep "mysql"
netstat -tunlp | grep 3306
```

30.如何杀死django进程？

```
ps -ef | grep "django" 找到django程序的pid
kill -9 pid
```

31.预习博客https://www.cnblogs.com/pyyu/articles/9355477.html