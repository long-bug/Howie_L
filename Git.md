## Git操作大全：

### 初始化

1. 下载： https://git-scm.com/downloads 
2. 创建一个文件夹，存放本地需要上传的文件
3. 鼠标右键点击 使用Git Bash 
4. 初始化文件夹：git init
5. 产生的.idea文件夹，不要轻易修改，这是git配置文件

### 基本操作

1. git status 查看仓库中所有的文件夹和文件的状态 

2. git add supercrm  让git管理单独的文件夹或者文件 

3. git add .  管理所有文件和文件夹

4. 配置用户名和邮箱 $ git config --global user.name <用户名> 

5. $ git config --global user.email <邮箱地址> 例如： $ git config --global user.name "吴超" 

6. $ git config --global user.email "1069696250@qq.com"

7. git commit -m '描述信息' 例如： git commit -m 'v1版本'

8. 二次开发：git add supercrm 

9. git commit -m 'v2版本'

10. 查看日志：git log

    ![image-20191114152435548](F:\Python学习笔记\图片\image-20191114152435548.png)

11. git reflog  #也是查看日志，但是包括回滚操作的版本 

12. git回滚：git reset --hard 版本号 

13. 切换用户：git checkout 名

14. 回滚文件名：git reset Head 文件名

15. git branch 查看当前分支

16. git branch dev创建开发环境分支

    



​	

