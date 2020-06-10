### 基于pandas的数据清洗：

##### 处理空值操作：

```
isnull ：df.isnull()--检测出原始数据中哪些行中存在空值
notnull：
any：可以帮助我们检测df中哪些行列中存在空值，必须配合isnull使用：isnull->any(axis=1)
all：也可以帮助我们检测元数据中哪些行列中存在空···值，必须配合notnull使用：notnull->all(axis=1)
dropna：删除元数据中存在空值的行数据：df.dropna(axis=0)：注意在drop函数中，0表示的是行，1表示的是列，与原生行列相反
fillna：覆盖元数据中存在的空数据，必须配合axis使用。
	df.fillna(method='bfill',axis=0) #使用紧邻值填充空值
	df.fillna(method='ffill',axis=1) #使用紧邻值填充空值
```

##### 处理重复操作：drop_duplicates

```
df.drop_duplicates(keep='first')：保留第一个重复的数据
df.drop_duplicates(keep='last')：保留最后一个重复的数据
df.drop_duplicates(keep=False)：全部删除
```

##### 处理异常数据：

```
df.drop(labels=xxxx):直接删除异常数据
```

##### 级联操作：级联是对表格做拼接

```
匹配级联：
pd.concat((df1,df1,df1),axis=1)：三张表按照列进行级联
pd.concat与np.concatenate函数类似，只是多了一些参数：
	objs
	axis=0
	keys
	join='outer' / 'inner':表示的是级联的方式，outer会将所有的项进行级联（忽略匹配和不匹配），而inner只会将匹配的项级联到一起，不匹配的不级联
	ignore_index=False
	
pd.append：df1.append(df2)

不匹配级联：不匹配指的是级联的维度的索引不一致。例如纵向级联时列索引不一致，横向级联时行索引不一致
    - 有2种连接方式：
        - 外连接：补NaN（默认模式）
        - 内连接：只连接匹配的项
```

##### 合并操作：合并是对表格中的数据进行汇总

```
merge与concat的区别在于，merge需要依据某一共同列来进行合并

使用pd.merge()合并时，会自动根据两者相同column名称的那一列，作为key来进行合并。

注意每一列元素的顺序不要求一致

一对一合并：pd.merge(df1,df2)--合并两个表
一对多合并：pd.merge(df3,df4)--合并表中的相同的字段
多对多合并：pd.merge(df1,df5)--合并表中的全部字段

key的规范化
当列冲突时，即有多个列名称相同时，需要使用on=来指定哪一个列作为key，配合suffixes指定冲突列名
pd.merge(df1,df2,on='group')

当两张表没有可进行连接的列时，可使用left_on和right_on手动指定merge中左右两边的哪一列列作为连接的列：pd.merge(df1,df5,left_on='employee',right_on='name')

内合并和外合并：out取并集，inner取交集
pd.merge(df6,df7,how='right')：右合并，按照右边的表结构进行合并，左边表中的数据没有值的时候填充空的
how：‘outer/inner’
left_on='xxxx',左表的字段
right_on='xxxx'右表的字段
```

##### 表中的数据

```
对象.info():查看表的数据
.unique： unique()是用来将Series中的元素进行去重操作
查询：query（条件）
排序：.sort_values（by='列名',ascending=False）
```

##### 替换操作：

```
替换操作可以同步作用于Series和DataFrame中
单值替换：df.replace(to_replace=3,value='Three')/df.replace(to_replace={3:'aaa'})
普通替换： 替换所有符合要求的元素:to_replace=15,value='e'
按列指定单值替换： to_replace={列标签：替换值} value='value'
#替换指定列中的值
df.replace(to_replace={5:77},value='6666666')


多值替换
列表替换: to_replace=[] value=[]
字典替换（推荐） to_replace={to_replace:value,to_replace:value}
```

##### 映射操作：

```python
概念：创建一个映射关系列表，把values元素和一个特定的标签或者字符串绑定（给一个元素值提供不同的表现形式）

dic = {
    'jay':'张三',
    'tom':'李四'
}
df['c_name'] = df['name'].map(dic)  #映射关系

映射索引
	使用rename()函数替换行列索引
参数介绍：
	index 替换行索引
	columns 替换列索引
    
new_index = {0:'first',1:'two',2:'three',3:'four',4:'five'}
new_col={'color':'cc','value':'vv'}
df4.rename(new_index,columns=new_col)
```

##### 排序实现的随机抽样

```Python
take()  ：可以更换原数据的行列位置，标注清楚axis就行
np.random.permutation()

np.random.permutation(3) #返回随机序列
```

##### 分类处理

```
数据分类处理的核心：

groupby()函数
groups属性查看分组情况

#根据水果的种类进行分组，使用by方法
df.groupby(by='item')

#调用groups查看分组情况
df.groupby(by='item').groups

如果要取其中的某个值或者计算某个数值推荐使用以下方法
df.groupby(by='item')['price'].mean() #推荐
```

##### 高级数据聚合

```
使用groupby分组后，也可以使用transform和apply提供自定义函数实现更多的运算
df.groupby('item')'price'.sum() <==> df.groupby('item')'price'.apply(sum)
transform和apply都会进行运算，在transform或者apply中传入函数即可
transform和apply也可以传入一个lambda表达式
```

```python
def myMean(s):
    sum = 0
    for i in s:
        sum += i
    return sum/len(s)
    
df.groupby(by='item')['price'].apply(myMean) #apply充当聚合的运算工具
/
f.groupby(by='item')['price'].transform(myMean) #transform充当聚合的运算工具
```

##### 数据加载

```
读取type.txt文件数据
example：data_1 = pd.read_csv('./data/type-.txt',sep='-',header=None)

读取数据库中的数据：
#连接数据库，获取连接对象
import sqlite3 as sqlite3
conn=sqlite3.connect('./data/weather_2012.sqlite（文件路径）')

#读取数据库中的数据：
sql_df=pd.read_sql('select * from weather_2012',conn)
sql_df

#将数据写入数据库中
data_1.to_sql('sql_data123',conn)


```

##### 透视表：

```
透视表是一种可以对数据动态排布并且分类汇总的表格格式，我们在pandas中把它称为pivot_table。

优点：
	灵活性高，可以随意定制分析需求
	脉络清晰抑郁理解数据
	操作性强。
	
pivot_table有四个最重要的参数index、values、columns、aggfunc	
	index：分类汇总的分类条件，每个pivot_table必须拥有一个index：df.pivot_table(index='列名')/df.pivot_table(index=['列名1','列2'])
	values参数：需要对计算的数据进行筛选：df.pivot_table(index=['列1','列2'],values=['列1','列2','列3'])
	Aggfunc参数：设置我们对数据聚合时进行的函数操作，如果我们不设置这个参数，默认是计算数据的均值（aggfunc='means'），也可以设置不同的addfunc参数：#还想获得james harden在主客场和不同胜负情况下的总得分、平均篮板、最大助攻时
df.pivot_table(index=['主客场','胜负'],aggfunc={'得分':'sum','篮板':'mean','助攻':'max'})
	Columns:可以设置列层次字段：对values字段进行分类df.pivot_table(index='主客场',values='得分',aggfunc='sum',columns='对手')
```

##### 交叉表：

```
是一种用于计算分组的特殊透视图，对数据进行汇总
	pd.crosstab(index,colums)。
		index:分组数据，交叉表的行索引
		columns:交叉表的列索引
        
例子：求出各个性别抽烟的人数
pd.crosstab(df.smoke,df.sex)
```

##### matplotlib绘图

```
import matplotlib.pyplot as plt
%matplotlib inline #保证绘制的图像可以被正常的显示加载出来
```

