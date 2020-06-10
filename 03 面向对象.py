# 1.面向对象初识

# 定义类

# class 类名(驼峰体):
#     静态属性(静态字段,类变量)
#     实例方法(动态属性,动态字段)


# class A:
#     print(1)  # 会执行这个代码
#
#     def __init__(self,name):  # 初始化方法
#         self.name = name      # 对象属性
#
#     def func(self):      # 实例方法
#         pass


# class A:
#     live = "有思想"
#
#     def __init__(self):  # 初始化方法
#         pass
#
#     def func(self):  # 实例方法
#         pass
#
# a = A()  # 实例化一个对象

# a 实例或对象

# 通过类名操作类属性和方法
    # 万能的点
    # A.body = "身体"  # 类中没有就是增加
    # A.live = "无脑"  # 类中有就是修改
    # del A.live       # 删
    # print(A.live)    # 查看某一个
    # A.func(1)        # 需要人工传参
    # print(A.__dict__)  # 查看类中所以的内容

# 通过对象操作类属性和方法

# 所有通过对象的操作都是封装到对象空间中
# 万能的点
# print(a.live)  # 查看类中的属性
# a.body = "有身体"  # 添加到对象中
# a.func()     # 自动传参


# class A:
#     live = "有思想"
#
#     def __init__(self):  # 初始化方法
#         pass
#
#     def func(self):  # 实例方法
#         pass
#
#
# a = A()  # 实例化一个对象

# 实例化时反生三件事:
# 1.给对象开辟空间
# 2.自动执行__init__方法,将对象隐性传参给self
# 3.给对象空间进行属性封装

# self 是什么?
# self 是函数位置参数
# self 也是实例本省  self的地址和对象的地址是一致的

# 一个类可以实例化对个对象:

# class A:
#     live = "有思想"
#
#     def __init__(self):  # 初始化方法
#         pass
#
#     def func(self):  # 实例方法
#         pass
#
#
# a1 = A()  # 实例化一个对象
# a2 = A()  # 实例化一个对象
# a3 = A()  # 实例化一个对象

# 2.类空间

# 类空间
# 对象空间:存储着实例化这个对象的类地址
# 查找顺序:向去对象空间查找,没有内容通过记录的类地址向类空间进行查找

# 类关系:
# 依赖关系: 将一个对象当做参数传递给另一个类的实例方法中就是依赖关系
# 组合关系: 将一个对象当做属性封装到另一个类的对象空间中就是组合关系

# 继承关系:
    # 单继承: 子类的括号中只写一个父类
    # python2.2之前都是经典类,python2.2之后经典类和新式类共存
    # python2中继承了object就是新式类,不继承就是经典类
    # python3中都是新式类

    # 多继承:
    # 经典类: 深度优先(从左向右查找),一级一级进行查看一级一级进行返回,查找过的就不查找了
    # 新式类: 按照c3算法(mro)
    # 新式类中才能使用mro   使用方法:类名.mro()

# 类的成员:

    # 私有成员:
    # 程序员约定俗称: _变量名
    # class A:
    #     __live = "有思想"  # 私有静态属性
    #
    #     def __init__(self,name):
    #         self.__name = name  # 私有对象属性
    #
    #     def __func(self):  # 私有实例方法
    #         pass

    # 在当前类的内部可以使用私有方法
    # 子类不能继承父类中私有的所有内容


    # def func(self):  # 实例方法
    #     pass

    # 类方法:
    # @classmethod  绑定给类

    #静态方法:
    # @staticmethod  不依赖对象和类名

    # 属性: (组合)
    # @property
    # def func():
    #     pass
    #
    # @func.setter
    # def func():
    #     pass

    # @func.getter
    # def func():
    #     pass

    # @func.deleter
    # def func():
    #     pass

# 类的三大特性:

    # 继承,封装,多态
    # 封装: 将代码或数据存储到某个空间中
    # 多态: Pyhton默认就是多态

    # 鸭子类型(编程思想):
    # class A:
    #
    #     def func1(self):
    #         pass
    #
    #     def func2(self):
    #         pass
    #
    # class B:
    #
    #     def func1(self):
    #         pass
    #
    #     def func2(self):
    #         pass

    # 统一接口,归一化设计(编程思想)

    # 类的约束(通过父类约束子类必须实现某个方法):

    # 方法一: 主动抛出异常  (推荐使用)
    #     raise Exception("子类必须写有某个方法")

    # 方法二: 强制规定
    # from abc import ABCMeta,abstractmethod

    # super 剖析
    # super(当前类,当前类实例的对象)  完全按照mro顺序进行查找
    # super(类名,self)  按照mro顺序列表查找类名下一个类, self 携带的mro顺序

    # class A:
    #     def func(self):
    #         print(11111)
    #
    # class B(A):
    #     pass
    #
    # class Foo(B):
    #
    #     def __init__(self):
    #         super(Foo,self).func()  #
    #
    # print(Foo.mro())
    # f = Foo()


    # class A:
    #     def func(self):
    #         print(11111)
    #
    # class B(A):
    #     pass
    #
    # class Foo(B):
    #
    #     def __init__(self):
    #         super(B,self).func()  #
    #
    # print(Foo.mro())
    # f = Foo()

    # class O(object):
    #     def func(self):
    #         print(000)
    #
    # class A(O):
    #     def func(self):
    #         super().func()
    #
    # class B(O):
    #     def func1(self):
    #         print(222)
    #
    # class C(A):
    #     def func(self):
    #         # pass
    #         super().func()
    #
    # class D(A):
    #     def func(self):
    #         print(444)
    #
    # class E(C,D):
    #     def func5(self):
    #         print(555)
    #
    # class F(B,E):
    #
    #     def __init__(self):
    #         super(F,self).func()
    #
    # print(F.mro())
    # f = F()

# 反射

    # hasattr(对象,字符串)
    # getattr(对象,字符串,查找不到时设置返回值)
    # setattr(对象,字符串,值)
    # delattr(对象,字符串)

    # class A:
    #     name = "le"
    #
    # setattr(A,"live","无脑")
    # print(A.__dict__)


# 双下方法 1.5
# 异常捕获 1.5