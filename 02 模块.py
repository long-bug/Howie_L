# 1.自定义模块

    # 飘红不一定代表报错
    # 模块分类:
    #     1.自定义
    #     2.内置
    #     3.第三方

    # 每一个py文件就是一个模块

    # 导入:
        # import 模块名
        # from 模块名 import 功能
        # from 导入顺序偏向于递归

    # 路径:
        # 绝对路径:从磁盘开始查找
        # 相对路径:当前文件夹下开始查找

        # 模块的查找的顺序:
        # 内存 -- 内置 -- 第三方 -- sys.path

        # sys.path.append("root/meet")
        # sys.paht.insert(0,"root/meet")

        # time
        # import time
        # time.sleep()
        # time.time()
        #
        # time.localtime()
        # time.strftime()
        #
        # time.strptime()
        # time.mktime()

        # datetime (了解)
        # from datetime import datetime
        # datetime.now()

    # random(随机数)

        # import random
        # random.random
        # random.randint
        # random.randrange
        # random.choice
        # random.choices
        # random.sample
        # random.shuffle


# 2.模块一

    # 序列化
        # json
        #     dumps loads
        #     dump load

        # pickle  (Python特有  -- 支持内容较多)
        #     dumps loads
        #     dump load

    # os
        # os.path.join()
        # os.path.abspath()
        # os.getcwd()
        # __file__ : 获取文件的路径

    # sys
        # sys.path

    # hashlib

        # 明文 -- 字节 -- 密文
        # 加密,校验
        # md5,sha1
        # 加盐
        # 动态加盐

    # collections
        # Counter 统计


# 软件开发规范:

    # """
    # blog
    # ├─ bin
    # │  └─ starts.py    启动文件
    # ├─ conf
    # │  └─ settings.py  配置文件
    # ├─ core
    # │  └─ src.py       逻辑文件
    # ├─ db
    # │  └─ register     数据文件
    # ├─ lib
    # │  └─ common.py    公共文件
    # └─ log
    # │  └─ logg.log     日志文件
    # ├─ README.md       使用手册
    # """

# 模块二:

    # re
    # 重要:
    # import re
    # search() 和 re.match()的区别
    # search() 是从字符串任意位置开始查找
    # match() 是从头开始查找,如果头部不配合就不继续查找了
    # group()

    # 贪婪
        # +
        # *

    # 非贪婪
        # ?

# 包:
#     文件夹下具有__init__.py就是一个包
#     导入:
#     import 包.模块
#     from 包 import 模块
#     from 包 import *
#     import 和 from 都支持 as
#     推荐使用 from

    # 路径:
    # 绝对路径: 包的根部
    # 相对路径:当前

    # 包同级写一个启动文件

