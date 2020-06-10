1. 了解哪些基于爬虫相关的模块？

   ```python
   网络请求：urllib，requests，aiohttp
   数据解析：re，xpath，bs4，pyquery
   selenium
   js逆向：pyexcJs
   ```

2. 常见的数据解析方式？

   ```Python
   xpath  正则  bs4  pyquery
   ```

3. 列举在爬虫过程中遇到的哪些比较难的反爬机制？

   ```Python
   UA检测 
   数据动态加载
   动态变化的请求参数
   js加密
   代理
   cookie
   ```

4. 简述如何抓取动态加载数据？

   ```Python
   基于抓包工具进行全局搜索
   如果动态加载的数据是密文，则全局搜索是搜索不到的
   
   动态加载：是指通过另一个请求单独请求到的数据
   解决办法：基于抓包工具进行全局搜索数据
   ```

5. 移动端数据如何抓取？

   ```Python
   在同一网络条件下，移动端进行数据访问之后，在电脑端使用抓包工具fiddle进行抓取。
   移动端使用appnium进行数据抓取
   网络配置
   ```

6. 抓取过哪些类型的数据，量级多少？

   ```Python
   文本，整型，  2W
   ```

7. 了解哪些爬虫框架？

   ```Python
   scrapy（异步）框架
   pyspider
   ```

8. 谈谈对scrapy的了解？

   ```Python
   是一个异步框架
   1. 高性能的网络请求
   2. 高性能的数据解析
   3. 高性能的持久化存储
   4. 全站数据爬取
   5. 深度爬取
   6. 分布式
   ```

9. 如何解析出携带标签的局部页面数据？

   ```Python
   使用bs4进行数据解析
   ```

10. scrapy核心组件？

    ```Python
    1. 引擎（Scrapy）：
    
       用来处理整个系统的数据流处理，触发事务（框架核心）
    
    2. 调度器（Scheduler）：
    
       用来接受引擎发过来的请求，亚茹队列中，并在引擎再次请求的时候返回，可以想象成一个URL（抓取网页的地址或者说是链接）的优先队列，由他来决定下一个要抓取的网址是什么，同时去除重复的网址
    
    3. 下载器（Downloader）：
    
       用于下载网页内容，并将网页内容返回给蜘蛛（Scrapy下载器是建立在twisted这个高效的异步模型上的）
    
    4. 爬虫（Spidres）：
    
       爬虫是主要干活的，用于特定的网页中提取自己需要的信息, 即所谓的实体(Item)。用户也可以从中提取出链接,让Scrapy继续抓取下一个页面
    
    5. 项目管道(Pipeline)
       负责处理爬虫从网页中抽取的实体，主要的功能是持久化实体、验证实体的有效性、清除不需要的信息。当页面被爬虫解析后，将被发送到项目管道，并经过几个特定的次序处理数据。
    ```

11. scrapy中间件的应用？

    ```Python
    作用：批量拦截请求和响应
    拦截请求：设置代理
    ```

12. 如何实现全站数据爬取？

    ```
    基于手动请求发送+递归解析
    基于CrwalSpider
    ```

13. 如何检测网站数据更新？

    ```Python
    增量式爬虫：
    ```

14. 分布式爬虫实现原理？

    ```Python
    基于scrapy-redis实现的分布式，可以提供共享的管道和调度器
    ```

15. 如何提升爬取数据的效率（异步爬虫）

    ```Python
    使用框架
    线程池
    多任务的异步协程
    分布式
    ```

16. 列举你接触的反爬机制？

    ```Python
    
    ```

17. scrapy中什么是深度优先和广度优先（优劣）

    ```Python
    默认情况下scrapy是深度优先
    深度优先：
    	占用的空间大，运行速度快
    广度优先：
    	占用的空间小，运行的速度慢
    ```

18. scrapy如何实现持久化存储

    ~~~Python
    1. 基于终端指令的持久化存储
    
       1. 只可以将parse方法的返回值存储到指定后缀（csv）文本文件中
       2. 指令：scrapy crawl 文件名 -o filePath
    
    2. 基于管道的持久化存储
    
       1. 实现流程：
    
          1. 数据解析（爬虫文件）
    
          2. 在items类中定义相关的属性（items.py）:fieldName = scrapy.Field()
    
          3. 将解析的数据存储封装到item类型的对象中（爬虫文件）：item['fieldName'] = value #给item对象的fieldName属性赋值
    
          4. 将item对象提交给管道（爬虫文件）：yield item #只可以将item提交给优先级最高的管道
    
          5. 在管道中接收item文件可以将item中存储的数据进行任意形式的持久化存储（pipelines.py）：process_item():负责接收item对象且对其进行持久化存储
    
          6. 在配置文件中开启管道机制：
    
             ```
             ITEM_PIPELINES = {
              #300：表示的是优先级，数值越小优先级越高
              'duanziPro.pipelines.DuanziproPipeline': 300,}
             ```
    
          7. 细节处理：
    
             1. 管道文件中的管道类表示的是什么？
                1. 一个管道类对应的就是一种存储形式
                2. 如果想要实现数据备份，则需要使用多个管道类（多种存储形式：数据库/redis）
             2. process_item中的return item：
                1. 将item传递给下一个即将被执行的管道类
    ~~~

19. 谈谈对crawlspider的理解，如何使用其进行深度爬取

    ```
    class scrapy.spider.CrawlSpider
    
    它是Spider的派生类，spider类的设计原则只是爬去start_url列表中的网页，而CrawlSpider类定义了一些规则来提供跟进link的方便机制，从爬取的网页中获取link的方便机制，从爬取的网页中获取link并继续爬取的工作更合适。
    ```

20. 如何实现数据清洗？

    ```
    清洗控制（缺失值）
    	将空值对应的行数据进行删除：dropna
    	使用近邻值填充空值：fillna
    清洗重复值
    	删除重复的行数据：drop_duplicates()
    清洗异常值
    	一定要有一个判定异常值的条件
    ```

21. 了解过机器学习吗？

    ```Python
    机器学习就是从“数据”中自动分析获得“规律（模型）”，并利用规律对未知数据进行预测
    特征工程：
    	特征预处理
        	归一化和标准化
         特征值化：将非数值型的数据转换成数值型的数据
        降维：
    sklean框架：
    	线性回归，knn，贝叶斯
    ```

22. 在爬虫中为什么需要是用selenium？selenium和爬虫之间的关联是什么？

    ```
    selenium是基于浏览器自动化的模块。
    使用selenium进行爬虫：
    1. 可以实现模拟登陆
    2. 便捷的帮我们捕获到动态加载的数据（可见既可得）
    ```

23. 列举你所熟知的selenium模块中的常用方法及其作用

    ```
    1. 必须提供浏览器对应的驱动
    
    2. 实例化一个浏览器对象
    
       ```python
       bro = webdriver.Chrome(executable_path='驱动程序的路径')
       ```
    
    3. 定位标签：使用find进行查找
    
    4. 向定制的标签内录入数据
    
    5. 点击或其他操作
    
    6. 注意：page_source：返回当前页面的页面源码数据（包含动态加载的数据）
    
    7. 缺点就是效率太低
    
    aiohttp：支持异步的网络请求模块，
    动作链模块：from selenium.webdriver import ActionChains
    无头浏览器：from selenium.webdriver.chrome.options import Options
    ```

24. 解释在多任务异步协程中事件循环（loop）的作用是什么？

    ```Python
    将其内部注册的任务对象进行异步执行
    # 创建一个事件循环对象
    loop = asyncio.get_event_loop()
    # 将任务对象注册到事件循环对象中并且开启事件循环
    loop.run_until_complete(task)
    
    
    注意: 事件循环对象中注册多个任务对象时,需要使用async.wait()对任务列表进行挂起操作
    loop.run_until_complete(async.wait(task_list))
    ```

25. 多任务异步协程是如何实现异步的？

    ```Python
    一个任务对象就是一个协程，也是一组特定的操作，将任务对象注册到事件循环中，就可以异步的执行每一组特定的操作
    await关键字：挂起
    wait方法：等待
    
    
    import asyncio
    from time import sleep
    import time
    import requests
    from lxml import etree
    import aiohttp
    urls = [
        'http://localhost:5000/bobo',
        'http://localhost:5000/jay',
        'http://localhost:5000/tom'
    ]
    start = time.time()
    #发起请求获取响应数据（不可以实现异步）
    # async def get_request(url):
    #     #requests是不支持异步的模块
    #     page_text = requests.get(url).text
    #     return page_text
    
    #基于aiohttp实现异步的网络请求
    async def get_request(url):
        #实例化了一个请求对象
        async with aiohttp.ClientSession() as sess:
            #with sess.get/post(url=url,headers=headers,data/params,proxy="http://ip:port") as response:
            async with await sess.get(url=url) as response:
                #text()：获取字符串形式的响应数据
                #read():获取bytes类型的响应数据
                page_text = await response.text()
    
                return page_text
    
    #定义回调函数
    def parse(task):
        page_text = task.result()#获取特殊函数的返回值（请求到的页面源码数据）
        tree = etree.HTML(page_text)
        print(tree.xpath('//*[@id="feng"]/text()')[0])
    
    tasks = []
    for url in urls:
        c = get_request(url)
        task = asyncio.ensure_future(c)
        task.add_done_callback(parse)
        tasks.append(task)
    
    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.wait(tasks))
    
    print('总耗时：',time.time()-start)
    
    注意：在书写特殊函数的时候，不要在函数内部出现不支持异步操作的代码，否则就会中断整个异步操作的执行
    1. requests不支持异步操作，不可以出现在函数内部
    2. aiohttp是一个支持异步的网络请求模块
    ```

26. 验证码如何处理？

    ```Python
    使用打码平台进行验证处理
    ```

27. scrapy 和 scrapy-redis 有什么区别？

    ```Python
    scrapy是一个Python爬虫框架，爬取效率极高，具有高度定制性，但是不支持分布式。而scrapy-redis是基于redis数据库、 运行在scrapy框架之上的组件,可以让scrapy支持分布式策略，Slaver端共享Master端redis数据库里的item队列、请求队列和请求指纹集合。
    ```

28. 说一说打开浏览器访问 www.baidu.com 获取到结果，整个流程。

    ```Python
    
    ```

29. 列出你知道 header 的内容以及信息

    ```
    User-Agent
    Connection
    ```

30. 简述scrapy的去重原理？

    ```
    scrapy本身自带一个中间件，
    scrapy源码中可以找到一个dupefilters.py去重器;
    需要将dont_filter设置为False开启去重，默认是True，没有开启去重；
    对于每一个url的请求，调度器都会根据请求得相关信息加密得到一个指纹信息，并且将指纹信息和set()集合中的指纹信息进 行 比对，如果set()集合中已经存在这个数据，就不在将这个Request放入队列中;
    如果set()集合中没有存在这个加密后的数据，就将这个Request对象放入队列中，等待被调度。
    ```

31. 下列叙述中错误的是：（1分）

    ```Python
    二叉树是线性结构
    ```
    
32. 简述前序、中序、后续遍历？ 

    ```Python
    前序遍历：对于当前节点，先输出当前节点的左节点，左节点输出完成之后进行右节点的输出
    中序遍历：对于当前节点，先输出当前节点的左节点，然后输出该节点，最后输出右节点
    后序遍历：对于当前节点，先输出当前节点的左节点，然后输出右节点，最后输出当前节点
    ```

33. 写代码：实现一个冒泡排序。

    ```Python
    
    ```

34. 写代码：实现一个快速排序。 

### 第二部分 补充题

1. 列举常见用的git命令？
2. 你们公司/团队用怎么做的协同开发？
3. 公司如何做代码review？谁来做？ 

4. 线上代码如果出现bug如何解决？ 

5. git rebase的作用？

git实战视频地址：https://www.bilibili.com/video/av70772636

