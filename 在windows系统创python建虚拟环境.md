### Windows下创建虚拟环境virtualenv

​       如果在一台电脑上, 想开发多个不同的项目, 需要用到同一个包的不同版本, 如果使用上面的命令, 在同一个目录下安装或者更新, 新版本会覆盖以前的版本, 其它的项目就无法运行了.而公司里面往往会存在多个项目的情况，所以需要使用虚拟环境，把当前项目所需要用到的模块及其版本进行隔离包装到一个虚拟环境中使用。

#### 安装：

```
pip install virtualenv -i https://pypi.tuna.tsinghua.edu.cn/simple  # 下载虚拟环境
pip install virtualenvwrapper -i https://pypi.tuna.tsinghua.edu.cn/simple  #下载虚拟环境管理工具
pip install virtualenvwrapper-win -i https://pypi.tuna.tsinghua.edu.cn/simple  #适用于windows的虚拟环境安装
```

#### 为什么需要 virtualenvwrapper？而不是virtualenv？

```
virtualenv 的一个最大的缺点就是，每次开启虚拟环境之前要去虚拟环境所在目录下的 bin 目录下 source 一下 activate，这就需要我们记住每个虚拟环境所在的目录。
```

```
一种可行的解决方案是，将所有的虚拟环境目录全都集中起来，比如放到 ~/envs/，并对不同的虚拟环境使用不同的目录来管理。virtualenvwrapper 正是这样做的。并且，它还省去了每次开启虚拟环境时候的 source 操作，使得虚拟环境更加好用。
```

#### 常用命令：

```
创建虚拟环境：                mkvirtualenv 虚拟环境名称
创建虚拟环境(指定python版本)： mkvirtualenv -p python 虚拟环境名称
查看所有虚拟环境：            workon+2次tab键
使用虚拟环境：               workon 虚拟环境名称
退出虚拟环境：               deactivate
删除虚拟环境（必须先退出虚拟环境内部才能删除当前虚拟环境）:
                           	rmvirtualenv 虚拟环境名称
    
其他相关命令：
查看虚拟环境中安装的包：              pip freeze  或者 pip list
收集当前环境中安装的包及其版本：       pip freeze > requirements.txt
在部署项目的服务器中安装项目使用的模块： pip install -r requirements.txt
```

提示:

+ 虚拟环境只会管理环境内部的模块和python解析器,对于源代码是毫无关系

- 创建虚拟环境需要联网
- 创建成功后, 会自动工作在这个虚拟环境上
- 工作在虚拟环境上, 提示符最前面会出现 “(虚拟环境名称)”



