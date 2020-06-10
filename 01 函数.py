# 1.函数的初识
# 定义函数
    # def 函数名():
        # 函数体 (函数体存放是代码)

# 调用函数
    # 函数名()

# 函数的返回值
    # def func():
    #     return None
    #     return [1,2,3]

    # return: 默认返回None 写了return不写内容返回的也是None
    # return终止当前函数,不执行return下方的代码
    # return 返回多个内容时 以元组的形式接收

    # def func():
    #     return 1,2,3,4,5
    #
    # a = func()
    # print(a)

# 函数的参数
    # def func(a,b):  # 形参
    #     print(a,b)
    #
    # func(1,2)  # 实参

    # 形参:
    #     位置 ,默认参数
    # 实参:
    #     位置, 关键字参数
    # 混合参数:
    # 传参: 将实参的内容传递给形参的过程就是传参

# 2.函数的进阶

    # 动态参数:*args,**kwargs
    # *args,**kwargs
    # *args 接受多余的位置参数
    # **kwargs 接受多余的关键字参数

    # def func(*agrs,**kwargs):  # * 和 ** 是聚合
        # *agrs,*kwargs  # 是打散

    # func(*list,**dict) # 将list这个列表打散.将dict这个字典打散 key=1,key1=2


    # def func(a,b,c,k=None,k1=None,*args,**kwargs):
    #     print(a,b,c,k,k1)
    #     print(args)  # tuple
    #     print(kwargs) # dict
    #     print(*args,*kwargs)
    #
    # func(1,2,3,4,k2=1,k1=2,k3=3)


    # def func(a,b,c,*args,k=None,k1=None,**kwargs):
    #     print(a,b,c,k,k1)
    #     print(args)  # tuple
    #     print(kwargs) # dict
    #     print(*args,*kwargs)
    #
    # func(1,2,3,4,k2=1,k1=2,k3=3)

    # 函数的注释
    # """ 对函数的描述 """
    # 查看函数的注释,函数名.__doc__
    # 查看函数的名字,函数名.__name__

    # 名称空间:
    # 加载顺序:内置 -- 全局 -- 局部
    # 取值顺序:局部 -- 全局 -- 内置

    # 作用域:
    # 全局作用域: 全局 + 内置
    # 局部作用域: 局部

    # 函数的嵌套

        # def func(a,b):
        #     return foo(a,b)
        #
        # def foo(b,a):
        #     return index(a+1,b+5)
        #
        # def index(a,d):
        #     def func(d,a):
        #         def foo(e,f):
        #             # print(e)
        #             pass
        #             return f
        #         return foo(d,a)
        #     return func(a,d)
        #
        # print(func(10,5))

    # global nonlocal
    # global: 只修改全局变量,没有时会创建
    # nonlocal:只修改局部的变量,修改离nonlocal最近的一层,如果没有就往上一层查找
    # 不可变数据类型才需要使用global nonlocal,可变数据类型直接修改就可以了


# 3.迭代器
    # 函数名的第一类对象及使用
    # 1.当做值被赋值
    # 2.当做容器中的元素
    # 3.当做另一个函数的参数
    # 4.当做函数的返回值

    # 可迭代对象
    #     具有__iter__方法的就是一个可迭代对象

    # 迭代器:
    # 具有__iter__和__next__方法的就是迭代器
    # 推荐使用iter()和next()

    # 迭代器:
    #     优点:节省空间
    #     缺点:不能直接查看值,一次性,使用不灵活

    # for循环的本质:
        # a = [1,2,3,4].__iter__()
        # while True:
        #     try:
        #         next(a)
        #     except StopIteration:
        #         break


# 4.生成器
        # 生成器的本质就是迭代器:
        # 生成器和迭代器的区别:生成器是程序员自己写的,迭代器是python自带的

        # 基于函数定义生成器
        # def func():
        #     yield 111

        # func() # 生成一个生成器

        # yield from
        # 将可迭代的对象逐个返回

        # 文件句柄就是一个迭代器

        # 区分迭代器和生成器
        # 1.内存地址
        # 2.send方法

    # 推导式:
        # 列表推导式:
        # [i for i in range(10)]
        # 字典推导式
        # {i:i+1 for i in range(10)}
        # 集合推导式
        # {i for i in range(10)}
        # 生成器表达式
        # (i for i in range(10))

    # 内置函数一:
        #     """
        #     all() any() bytes() callable() chr() complex() divmod() eval()
        #     exec() frozenset() globals() hash() help() id() input()
        #     int() iter() locals() next() oct() ord() pow() repr() round()
        #     """

# 5.内置函数
#         """
#         abs() format()enumerate() filter() map() max() min() open() range() print()
#         len() list() dict() str() float() reversed() set() sorted() sum()
#         tuple() type() zip() dir()
#         """

        # lambda
        # filter()
        # map()
        # sorted()
        # zip()
        # reversed()  # 返回的都是列表
        # reduce()  累计算


        # lambda x:x
        # 匿名函数:函数名 lambda
        # x:形参 (可以不写,可以写多个)
        # :x返回值(必须写,只能返回一个数据类型)

        # class B(object):
        #     def __init__(self):
        #         pass
        #
        #     def func(self):
        #         pass

        # print(dir(B))

# 5.闭包:

    # 在嵌套函数内,使用非本层且非全局变量的就是闭包
    # def func(a):  # a == 自由变量
    #     def foo():
    #         print(a)
    #     return foo
    # func(1)   # 完整的闭包

# 6.装饰器:

    # 开发封闭原则: 对扩展功能进行开发,对修改源码及调用方式封闭
    # def func(f):
    #     def inner(*args,**kwargs):
    #         f(*args,**kwargs)
    #     return inner
    # 语法糖: @

# 7.装饰器的进阶

    # 有参装饰器:

    # def flag(argv):
    #     def func(f):
    #         def inner(*args,**kwargs):
    #             if argv:
    #                 f(*args,**kwargs)
    #         return inner
    #     return func

    # 多个装饰器装饰一个函数:
    # @auth1
    # @auth2
    # @auth3
    # def func():
    #     pass

    # 递归:
    # 1.自己不断调用自己本身
    # 2.有明确的结束条件

# def func(faa):
#     def foo():
#         print("装饰前")
#         ret = faa()
#         print("装饰后")
#         return ret
#     return foo
# @func
# def faa():
#     print("这是函数")

# faa = func(faa)
# print(faa())

# def foo(*args,**kwargs):
#     print("args=",args)
#     print("**kwargs",kwargs)
#     print("-------------")
# if __name__ =="__main__":
#     foo(1,2,3,4)
#     foo(a=1,b=2,c=3)
#     foo(1,2,3,4,a=1,b=2,c=3)
#     foo("a",1,None,a=1,b="2",c=3)

# nums = range(2,20)
# for i in nums:
#     nums = filter(lambda x:x==i or x % i ,nums)
# print(nums.__next__())
# print(nums.__next__())
# print(nums.__next__())
# print(nums.__next__())

