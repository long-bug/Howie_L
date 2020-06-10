[TOC]

### vue基础

------

#### 历史介绍

- angular 09年，年份较早，一开始大家是拒绝  star:
  - ![image-20190919153020189](C:/Users/heyul/Desktop/assets/image-20190919153020189.png)
- react 2013年, 用户体验好，直接拉到一堆粉丝 star:
  - ![image-20190919153045496](C:/Users/heyul/Desktop/assets/image-20190919153045496.png)
- vue 2014年,  用户体验好  作者:尤雨溪 江苏无锡人 国人骄傲
  - ![image-20190919153125427](C:/Users/heyul/Desktop/assets/image-20190919153125427.png)

#### 前端框架与库的区别?

- jquery 库 => DOM(操作DOM) + 请求
- 有可能学习了一些art-template 库 -> 模板引擎
- 框架 
  - 全方位功能齐全
  - 简易的DOM体验 + 发请求 + 模板引擎 + 路由功能
- KFC的世界里,库就是一个小套餐, 框架就是全家桶
- 代码上的不同
  - 一般使用库的代码，是调用某个函数，我们自己把控库的代码
  - 一般使用框架，其框架在帮我们运行我们编写好的代码
    - 框架:  初始化自身的一些行为
      - 执行你所编写的代码
      - 施放一些资源

#### vue起步

- 1:引包

- 2:启动 

  ```js
  new Vue({
      el:'#app',//目的地
      data:{
        //保存数据的地方  
      },
      template:`模板内容`
  });
  ```

#### 插值表达式

- {{ 表达式 }}
  - 对象 (不要连续3个{{ {name:'jack'} }})
  - 字符串 {{ 'xxx' }}
  - 判断后的布尔值  {{  true }}
  - 三元表达式  {{ true?'是正确':'错误'  }}
- 可以用于页面中简单粗暴的调试
- 要用插值表达式 必须要data中声明该属性

#### 什么是指令

- 在vue中提供了一些对于页面 + 数据的更为方便的输出,这些操作就叫做指令, 以v-xxx表示
  - 比如html页面中的属性 ```<div v-xxx ></div>``

- 比如在angular中 以ng-xxx开头的就叫做指令
- 在vue中 以v-xxx开头的就叫做指令
- 指令中封装了一些DOM行为, 结合属性作为一个暗号, 暗号有对应的值,根据不同的值，框架会进行相关DOM操作的绑定

#### vue中常用的v-指令演示

- v-text:元素的textContent属性,必须是双标签 跟{{ }}效果是一样的 使用较少
- v-html: 元素的innerHTML
- v-if : 判断是否插入这个元素,相当于对元素的销毁和创建
- v-else-if
- v-else
- v-show 隐藏元素  如果确定要隐藏,   会给元素的style加上display:none。是基于css样式的切换

#### v-if和v-show的区别 (官网解释)

`v-if` 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。

`v-if` 也是**惰性的**：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。

相比之下，`v-show` 就简单得多——不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换。

一般来说，`v-if` 有更高的切换开销，而 `v-show` 有更高的初始渲染开销。因此，如果需要非常频繁地切换，则使用 `v-show` 较好；如果在运行时条件很少改变，则使用 `v-if` 较好。

#### v-bind使用

- 给元素的属性赋值 

  - 可以给已经存在的属性赋值 input value
  - 也可以给自定义属性赋值 mydata

- 语法 在元素上 `v-bind:属性名="常量||变量名"`

- 简写形式 `:属性名="变量名"`

- ```html
  <div v-bind:原属性名="变量"></div>
  <div :属性名="变量">
  </div>
  ```

#### v-on的使用

- 处理自定义原生事件的,给按钮添加click并让使用变量的样式改变
- 普通使用   ```v-on:事件名="表达式||函数名"```
- 简写方式  ``` @事件名="表达式"```

#### v-model 双向的数据绑定

- 双向数据流（绑定）
  - 页面改变影响内存(js)
  - 内存(js)改变影响页面

#### v-bind 和 v-model 的区别

- `input v-model="name"`

  - 双向数据绑定  页面对于input的value改变，能影响内存中name变量
  - 内存js改变name的值，会影响页面重新渲染最新值

- `input :value="name"`

  - 单向数据绑定 内存改变影响页面改变

- v-model: 其的改变影响其他  v-bind: 其的改变不影响其他

- v-bind就是对属性的简单赋值,当内存中值改变，还是会触发重新渲染

  

#### v-for的使用

- 基本语法 `v-for="item in arr"`
- 对象的操作 `v-for="item in obj"`
- 如果是数组没有id
  - `v-for="(item,index) in arr" :class="index" :key='index' `
- v-for的优先级最高

#### 侦听器watch

基本的数据类型可以使用watch直接监听，复杂数据类型Object Array 要深度监视

```html
<div id='app'>
    <input type="text" v-model='msg'>
    <h3>{{msg}}</h3>
    <h3>{{stus[0].name}}</h3>
    <button @click='stus[0].name = "Tom"'>改变</button>
</div>
<script src="./vue.js"></script>
<script>
    new Vue({
        el: '#app',
        data: {
            msg:'',
            stus:[{name:'jack'}]
        },
        watch: {
            // key是属于data对象的属性名 value:监视后的行为 newV :新值 oldV:旧值
            'msg':function(newV,oldV){
                // console.log(newV,oldV);
                if(newV === '100'){
                    console.log('hello');
                }

            },
            // 深度监视： Object |Array
            "stus":{
                deep:'true',
                handler:function(newV,oldV){
                    console.log(newV[0].name);

                }
            }
        },
    })
```



#### 计算属性之computed

```html
<div id='app'>
    {{reverseMsg}}
    <h3>{{fullName}}</h3>
    <button @click='handleClick'>改变</button>
</div>
<script src="./vue.js"></script>
<script>
    new Vue({
        el: '#app',
        data: {
            msg: 'hello world',
            firstName: '小马',
            lastName: '哥'
        },
        methods: {
            handleClick(){
                this.msg = '计算属性computed';
                this.lastName = '妹';
            }
        },
        computed: {
            // computed默认只有getter方法
            // 计算属性最大的优点：产生缓存 如果数据没有发生变化 直接从缓存中取
            reverseMsg: function () {
                return this.msg.split('').reverse().join('')
            },
            fullName: function () {
                return this.firstName + this.lastName;
            }
        },

    })
</script>
```



#### 过滤器

```html
<div id="app">
    <h3>{{price | myPrice('¥')}}</h3>
    <h3>{{msg|myReverse}}</h3>
</div>
<script src="./vue.js"></script>
<script>
    // 创建全局过滤器
    Vue.filter('myReverse', (val) => {
        return val.split('').reverse().join('');
    })
    // 为数据添油加醋
    // ¥  $20
    new Vue({
        el: '#app',
        data: {
            price: 10,
            msg:'hello 过滤器'
        },
        // 局部过滤器
        filters: {
            myPrice: function (price, a) {
                return a + price;

            }
        }

    })
</script>
```



#### 案例：音乐播放器

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>案例:音乐播放器</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        ul {
            list-style: none;
        }

        ul li {
            margin: 20px 20px;
            padding: 10px 5px;
            border-radius: 3px;
        }

        ul li.active {
            background-color: #D2E2F3;
        }
    </style>
</head>

<body>
    <div id='app'>
        <audio :src="currentSrc" controls autoplay @ended='handleEnded'></audio>
        <ul>
            <li :class='{active:index===currentIndex}' v-for='(item,index) in musicData' :key='item.id'
                @click='handleClick(item.songSrc,index)'>
                <h2>{{item.id}}-歌名：{{item.name}}</h2>
                <p>{{item.author}}</p>
            </li>
        </ul>
        <button @click='handleNext'>下一首</button>
    </div>

    <script src="./vue.js"></script>
    <script>
        const musicData = [{
                id: 1,
                name: '于荣光 - 少林英雄',
                author: '于荣光',
                songSrc: './static/于荣光 - 少林英雄.mp3'
            },
            {
                id: 2,
                name: 'Joel Adams - Please Dont Go',
                author: 'Joel Adams',
                songSrc: './static/Joel Adams - Please Dont Go.mp3'
            },
            {
                id: 3,
                name: 'MKJ - Time',
                author: 'MKJ',
                songSrc: './static/MKJ - Time.mp3'
            },
            {
                id: 4,
                name: 'Russ - Psycho (Pt. 2)',
                author: 'Russ',
                songSrc: './static/Russ - Psycho (Pt. 2).mp3'
            }
        ];

        new Vue({
            el: '#app',
            data: {
                musicData,
                currentSrc: './static/于荣光 - 少林英雄.mp3',
                currentIndex: 0
            },
            methods: {
                handleClick(src, index) {
                    this.currentSrc = src;
                    this.currentIndex = index;
                },
                handleEnded() {
                    // // 下一首的播放
                    // this.currentIndex++;
                    // this.currentSrc = this.musicData[this.currentIndex].songSrc;
                    this.handleNext();
                },
                handleNext() {
                    this.currentIndex++;
                    if (this.currentIndex === this.musicData.length) {
                        this.currentIndex = 0;
                    }
                    this.currentSrc = this.musicData[this.currentIndex].songSrc
                }
            }
        })
    </script>

</body>

</html>
```



[TOC]

### 组件基础

#### 什么是组件

其实突然出来的这个名词,会让您不知所以然,如果大家使用过bootstrap的同学一定会对这个名词不陌生,我们其实在很早的时候就接触这个名词

通常一个应用会以一颗嵌套的组件树的形式来阻止:

![image-20190919160820754](F:\Python学习笔记\图片\image-20190919160820754.png)

#### 局部组件

使用局部组件的打油诗: 建子 挂子 用子

> 注意:在组件中这个data必须是一个函数,返回一个对象

```html
<div id="app">
      <!-- 3.使用子组件 -->
    <App></App>
</div>
<script>
//1.创建子组件
const App = {
    //必须是一个函数
    data() {
        return {
            msg: '我是App组件'
        }
    },
    components: {
        Vcontent
    },
    template: `
    <div>
    	<Vheader></Vheader>
    	<div>
    		<Vaside />  
    		<Vcontent />
    	</div>
    </div>
    `
}
new Vue({
    el: '#app',
    data: {

    },
    components: {
        // 2.挂载子组件
        App
    }

})
</script>
```

#### 全局组件

通过`Vue.component(组件名,{})`创建全局组件,此时该全局组件可以在任意模板(template)中使用

```js
Vue.component('Child',{
    template:`
    <div>
        <h3>我是一个子组件</h3>   
    </div>
`
})
```

#### 组件通信

##### 父传子

如果一个网页有一个博文组件,但是如果你不能向这个组件传递某一篇博文的标题和内容之类想展示的数据的话,它是没有办法使用的.这也正是prop的由来

父组件往子组件通信:**通过Prop向子组件传递数据**

```js
Vue.component('Child',{
    template:`
    <div>
        <h3>我是一个子组件</h3>   
        <h4>{{childData}}</h4>
    </div>
`,
    props:['childData']
})
const App = {
    data() {
        return {
            msg: '我是父组件传进来的值'
        }
    },
    template: `
    <div>
    	<Child :childData = 'msg'></Child>
    </div>
	`,
    computed: {

    }
}
```

1. 在子组件中声明props接收在父组件挂载的属性
2. 可以在子组件的template中任意使用
3. 在父组件绑定自定义的属性

##### 子传父

网页上有一些功能可能要求我们和父组件进行沟通

子组件往父组件通信: **监听子组件事件,使用事件抛出一个值**

```js
Vue.component('Child', {
    template: `
	<div>
        <h3>我是一个子组件</h3>   
        <h4>{{childData}}</h4>
        <input type="text" @input = 'handleInput'/>
	</div>
`,
    props: ['childData'],
    methods:{
        handleInput(e){
            const val = e.target.value;
            //使用$emit触发子组件的事件
            this.$emit('inputHandler',val);
        }
    },
})

const App = {
    data() {
        return {
            msg: '我是父组件传进来的值',
            newVal:''
        }
    },
    methods:{
        input(newVal){
            // console.log(newVal);
            this.newVal = newVal;
        }
    },
    template: `
    <div>
        <div class='father'>
        数据:{{newVal}}
        </div>
		<!--子组件监听事件-->
        <Child :childData = 'msg' @inputHandler = 'input'></Child>
    </div>
`,
    computed: {

    }
}
```

1. 在父组件中 子组件上绑定自定义事件

2. 在子组件中 触发原生的事件 在事件函数通过this.$emit触发自定义的事件

##### 平行组件

在开发中,可能会存在没有关系的组件通信,比如有个博客内容显示组件,还有一个表单提交组件,我们现在提交数据到博客内容组件显示,这显示有点费劲.

为了解决这种问题,在vue中我们可以使用bus,创建中央事件总线

```js
const bus = new Vue();
// 中央事件总线 bus
Vue.component('B', {
    data() {
        return {
            count: 0
        }
    },
    template: `
<div>{{count}}</div>
`,
    created(){
        // $on 绑定事件
        bus.$on('add',(n)=>{
            this.count+=n;
        })
    }
})

Vue.component('A', {
    data() {
        return {

        }
    },
    template: `
    <div>
   	 <button @click='handleClick'>加入购物车</button> 
    </div>
`,
    methods:{
        handleClick(){
            // 触发绑定的函数 // $emit 触发事件
            bus.$emit('add',1);
        }
    }
})
```

##### 其它组件通信方式

父组件 provide来提供变量,然后再子组件中通过inject来注入变量.无论组件嵌套多深

```js
Vue.component('B', {
    data() {
        return {
            count: 0
        }
    },
    inject:['msg'],
    created(){
        console.log(this.msg);

    },
    template: `
    <div>
        {{msg}}
    </div>
`,
})

Vue.component('A', {
    data() {
        return {

        }
    },
    created(){
        // console.log(this.$parent.$parent);
        // console.log(this.$children);
        console.log(this);


    },
    template: `
<div>
	<B></B>
</div>
`
})
new Vue({
    el: '#app',
    data: {

    },
    components: {
        // 2.挂载子组件
        App
    }

})
```

#### 插槽

##### 匿名插槽

子组件定义 slot 插槽，但并未具名，因此也可以说是默认插槽。只要在父元素中插入的内容，默认加入到这个插槽中去

```js
Vue.component('MBtn', {
    template: `
    <button>
    	<slot></slot>
    </button>
`,
    props: {
        type: {
            type: String,
            defaultValue: 'default'
        }
    },
})

const App = {
    data() {
        return {

        }
    },
    template: `
    <div>
        <m-btn>登录</m-btn>
        <m-btn>注册</m-btn>
        <m-btn>提交</m-btn>
    </div>
`,
}
new Vue({
    el: '#app',
    data: {

    },
    components: {
        // 2.挂载子组件
        App
    }

})
```



##### 具名插槽

具名插槽可以出现在不同的地方，不限制出现的次数。只要匹配了 name 那么这些内容就会被插入到这个 name 的插槽中去

```js
Vue.component('MBtn',{
    template:`
    <button :class='type' @click='clickHandle'>
        <slot name='register'></slot>
        <slot name='login'></slot>
        <slot name='submit'></slot>
    </button>
`,
    props:{
        type:{
            type: String,
            defaultValue: 'default'
        }
    },
    methods:{
        clickHandle(){
            this.$emit('click');
        }
    }
})

const App = {
    data() {
        return {

        }
    },
    methods:{
        handleClick(){
            alert(1);
        },
        handleClick2(){
            alert(2);
        }
    },
    template: `
<div>
	<MBtn type='default' @click='handleClick'>
		<template slot='register'>
			注册
		</template>    
	</MBtn>
    <MBtn type='success' @click='handleClick2'>
        <template slot='login'>
             登录
        </template>
    </MBtn>
    <MBtn type='danger'>
    	<template slot='submit'>
    		提交
    	</template>
    </MBtn>
</div>
`,
}
new Vue({
    el: '#app',
    data: {

    },
    components: {
        App
    }

})
```



##### 作用域插槽

通常情况下普通的插槽是父组件使用插槽过程中传入东西决定了插槽的内容。但有时我们需要获取到子组件提供的一些数据，那么作用域插槽就排上用场了

```js
Vue.component('MyComp', {
    data(){
        return {
            data:{
                username:'小马哥'
            }
        }
    },
    template: `
    <div>
        <slot :data = 'data'></slot>
        <slot :data = 'data' name='one'></slot>
    </div>
	`
})

const App = {
    data() {
        return {

        }
    },
    template: `
    <div>
        <MyComp>
        	<!--默认的插槽 default可以省略-->
        	<template v-slot:default='user'>
        	{{user.data.username}}
        </template>    

        </MyComp>
        <MyComp>
        	<!--与具名插槽配合使用-->
        	 <template v-slot:one='user'>
       		 {{user.data.username}}
        </template>
        </MyComp>
    </div>
`,
}
new Vue({
    el: '#app',
    data: {

    },
    components: {
        App
    }

})

```

##### 作用域插槽应用

先说一下我们假设的应用常用场景，我们已经开发了一个代办事项列表的组件，很多模块在用，现在要求在**不影响已测试通过的模块功能和展示**的情况下，给**已完成的代办项增加一个对勾效果**。

**也就是说，代办事项列表组件要满足一下几点**

1. 之前数据格式和引用接口不变，正常展示
2. 新的功能模块增加对勾

 ```js
const todoList = {
    data(){
        return {

        }
    },
    props:{
        todos:Array,
        defaultValue:[]
    },
    template:`
    <ul>
    	<li v-for='item in todos' :key='item.id'>
    		<slot :itemValue='item'>
    		{{item.title}}    
    		</slot>
    	</li>
    </ul>
`
}

const App = {
    data() {
        return {
            todoList: [
                {
                    title: '大哥你好么',
                    isComplate:true,
                    id: 1
                },
                {
                    title: '小弟我还行',
                    isComplate:false,
                    id: 2
                },
                {
                    title: '你在干什么',
                    isComplate:false,
                    id: 3
                },
                {
                    title: '抽烟喝酒烫头',
                    isComplate:true,
                    id: 4
                }
            ]
        }
    },
    components:{
        todoList
    },
    template: `
    <todoList :todos='todoList'>
    	<template v-slot='data'>
    	  <input type='checkbox' v-model='data.itemValue.isComplate'/>
    	  {{data.itemValue.title}}
    	</template>
    </todoList>
`,
}
new Vue({
    el: '#app',
    data: {

    },
    components: {
        App
    }

})

 ```



###  生命周期

“你不需要立马弄明白所有的东西，不过随着你的不断学习和使用，它的参考价值会越来越高。

当你在做项目过程中,遇到了这种问题的时候,再回过头来看这张图

#### 什么是生命周期

每个 Vue 实例在被创建时都要经过一系列的初始化过程。
例如：从开始创建、初始化数据、编译模板、挂载Dom、数据变化时更新DOM、卸载等一系列过程。
我们称 **这一系列的过程** 就是Vue的生命周期。
通俗说就是Vue实例从创建到销毁的过程，就是生命周期。
同时在这个过程中也会运行一些叫做**生命周期钩子**的函数，这给了用户在不同阶段添加自己的代码的机会，利用各个钩子来完成我们的业务代码。

####  干货满满

![image-20190925160832887](F:\Python学习笔记\图片\image-20190925160832887.png) 

#### 生命周期钩子

##### beforCreate

实例初始化之后、创建实例之前的执行的钩子事件 

 ```js
Vue.component('Test',{
    data(){
        return {
            msg:'小马哥'
        }
    },
    template:`
    <div>
    	<h3>{{msg}}</h3>
    </div>
	`,
    beforeCreate:function(){
        // 组件创建之前
        console.log(this.$data);//undefined

    }
})

 ```

效果:

![image-20190925162302131](F:\Python学习笔记\图片\image-20190925162302131.png)

> 创建实例之前，数据观察和事件配置都没好准备好。也就是数据也没有、DOM也没生成



##### created

实例创建完成后执行的钩子

```js
created() {
    console.log('组件创建', this.$data);
}

```

效果:

![image-20190925162331402](F:\Python学习笔记\图片\image-20190925162331402.png)

> 实例创建完成后，我们能读取到数据data的值，但是DOM还没生成,可以在此时发起ajax

##### beforeMount

将编译完成的html挂载到对应的**虚拟DOM**时触发的钩子 此时页面并没有内容。 即此阶段解读为: 即将挂载

```js
beforeMount(){
    // 挂载数据到 DOM之前会调用
    console.log('DOM挂载之前',document.getElementById('app'));
}

```

效果:

![image-20190925162531926](F:\Python学习笔记\图片\image-20190925162531926.png)

##### mounted

编译好的html挂载到页面完成后所执行的事件钩子函数

```js
mounted() {
    console.log('DOM挂载完成',document.getElementById('app'));
}

```

效果:

![image-20190925162930143](F:\Python学习笔记\图片\image-20190925162930143.png)



##### beforeUpdate和updated

```js
beforeUpdate() {
    // 在更新DOM之前 调用该钩子，应用：可以获取原始的DOM
    console.log('DOM更新之前', document.getElementById('app').innerHTML);
},
updated() {
    // 在更新DOM之后调用该钩子，应用：可以获取最新的DOM
  console.log('DOM更新完成', document.getElementById('app').innerHTML);
}

```

效果:

![image-20190925163351309](F:\Python学习笔记\图片\image-20190925163351309.png)

##### beforeDestroy和destroyed

当子组件在v-if的条件切换时,该组价处于创建和销毁的状态

```js
beforeDestroy() {
    console.log('beforeDestroy');
},
destroyed() {
    console.log('destroyed');
},

```

##### activated和deactivated

当配合vue的内置组件`<keep-alive>`一起使用的时候,才会调用下面此方法

`<keep-alive>`组件的作用它可以缓存当前组件

```js
activated() {
    console.log('组件被激活了');
},
deactivated() {
   console.log('组件被停用了');
},

```

### 组件进阶

##### 获取DOM和子组件对象

尽管存在 prop 和事件，有的时候你仍可能需要在 JavaScript 里直接访问一个子组件。为了达到这个目的，你可以通过 `ref` 特性为这个子组件赋予一个 ID 引用。例如：

```js
const Test = {
    template: `<div class='test'>我是测试组件</div>`
}
const App = {
    data() {
        return {

        }
    },
    created() {
        console.log(this.$refs.test); //undefined

    },
    mounted() {
        // 如果是组件挂载了ref 获取是组件对象,如果是标签挂载了ref,则获取的是DOM元素
        console.log(this.$refs.test);
        console.log(this.$refs.btn);

        // 加载页面 让input自动获取焦点
        this.$refs.input.focus();

    },
    components: {
        Test
    },
    template: `
    <div>
        <button ref = 'btn'></button>
        <input type="text" ref='input'>
        <Test ref = 'test'></Test>
    </div>
	`
}
new Vue({
    el: '#app',
    data: {

    },
    components: {
        App
    }
})

```

##### nextTick的用法

将回调延迟到下次 DOM 更新循环之后执行。在修改数据之后立即使用它，然后等待 DOM 更新

有些事情你可能想不到,vue在更新DOM时是**异步**执行的.只要侦听到数据变化,Vue将开启一个队列,并缓存在同一事件循环中发生的所有数据变更.如果同一个wather被多次触发,只会被推入到队列中一次.这种在缓冲时去除重复数据对于避免不必要的计算和 DOM 操作是非常重要的。然后，在下一个的事件循环“tick”中，Vue 刷新队列并执行实际 (已去重的) 工作

```html
<div id="app">
    <h3>{{message}}</h3>
</div>
<script src="./vue.js"></script>
<script>
    const vm = new Vue({
        el:'#app',
        data:{
            message:'123'
        }
    })
    vm.message = 'new Message';//更新数据
    console.log(vm.$el.textContent); //123
    Vue.nextTick(()=>{
        console.log(vm.$el.textContent); //new Message

    })

</script>

```

当你设置`vm.message = 'new Message'`,该组件不会立即重新渲染.当刷新队列时,组件会在下一个事件循环'tick'中更新.多数情况我们不需要关心这个过程，但是如果你想基于更新后的 DOM 状态来做点什么，这就可能会有些棘手。虽然 Vue.js 通常鼓励开发人员使用“数据驱动”的方式思考，避免直接接触 DOM，但是有时我们必须要这么做。为了在数据变化之后等待 Vue 完成更新 DOM，可以在数据变化之后立即使用 `Vue.nextTick(callback)`。这样回调函数将在 DOM 更新完成后被调用。

##### nextTick的应用

> 有个需求:
>
> 在页面拉取一个接口，这个接口返回一些数据，这些数据是这个页面的一个浮层组件要依赖的，然后我在接口一返回数据就展示了这个浮层组件，展示的同时，上报一些数据给后台（这些数据就是父组件从接口拿的），这个时候，神奇的事情发生了，虽然我拿到数据了，但是浮层展现的时候，这些数据还未更新到组件上去,上报失败

```js
const Pop = {
    data() {
        return {
            isShow:false
        }
    },
    template:`
    <div v-show = 'isShow'>
    	{{name}}
    </div>
	`,
    props:['name'],
    methods: {
        show(){
            this.isShow = true; 
            alert(this.name);
        }
    },
}
const App = {
    data() {
        return {
            name:''
        }
    },
    created() {
        // 模拟异步请求的数据
        setTimeout(() => {
            this.name = '小马哥',
            this.$refs.pop.show();
        }, 2000);
    },
    components:{
        Pop
    },
    template: `<pop ref='pop' :name='name'></pop>`
}
const vm = new Vue({
    el: '#app',
    components: {
        App
    }
})

```

**完美解决:**

```js
 created() {
     // 模拟异步请求的数据
     setTimeout(() => {
         this.name = '小马哥',
          this.$nextTick(()=>{
               this.$refs.pop.show();
         })
     }, 2000);
},

```

##### 对象变更检测注意事项

由于JavaScript的限制,**Vue不能检测对象属性的添加和删除**

对于已经创建的实例,Vue不允许动态添加根级别的响应式属性.但是,可以通过`Vue.set(object,key,value)`方法向嵌套独享添加响应式属性

```html
<div id="app">
    <h3>
        {{user.name}}{{user.age}}
        <button @click='handleAdd'>添加年龄</button>
    </h3>
</div>
<script src="./vue.js"></script>
<script>
    new Vue({
        el:'#app',
        data:{
            user:{},
        },
        created() {
            setTimeout(() => {
                this.user = {
                    name:'张三'
                }
            }, 1250);
        },
        methods: {
            handleAdd(){
                console.log(this);
                // 无响应式 
                // this.user.age = 20;
                // 响应式的
                this.$set(this.user,'age',20);
            }
        },
    })
</script>

```

```js
this.$set(this.user,'age',20);//它只是全局Vue.set的别名

```

如果想为已存在的对象赋值多个属性,可以使用`Object.assign()`

```js
// 一次性响应式的添加多个属性
this.user = Object.assign({}, this.user, {
    age: 20,
    phone: '113131313'
})

```

### 混入mixin偷懒

> 混入(mixin)提供了一种非常灵活的方式,来分发Vue组件中的可复用功能.一个混入对象可以包含任意组件选项.
>
> 一个混入对象可以包含任意组件选项。当组件使用混入对象时，所有混入对象的选项将被“混合”进入该组件本身的选项。

```html
<div id="app">
    {{msg}}
</div>
<script src="./vue.js"></script>
<script>
    const myMixin = {
        data(){
            return {
                msg:'123'
            }
        },
        created() {
            this.sayHello()
        },
        methods: {
            sayHello(){
                console.log('hello mixin')
            }
        },
    }
    new Vue({
        el: '#app',
        data(){
            return {
                msg:'小马哥'
            }
        },
        mixins: [myMixin]
    })

```

**mixin应用**

有一种很难常见的情况:有两个非常相似的组件,他们共享同样的基本函数,并且他们之间也有足够的不同,这时你站在了一个十字路口：我是把它拆分成两个不同的组件？还是只使用一个组件，创建足够的属性来改变不同的情况。

这些解决方案都不够完美：如果你拆分成两个组件，你就不得不冒着如果功能变动你要在两个文件中更新它的风险，这违背了 DRY 前提。另一方面，太多的属性会很快会变得混乱不堪，对维护者很不友好，甚至是你自己，为了使用它，需要理解一大段上下文，这会让你感到失望。

使用混合。Vue 中的混合对编写函数式风格的代码很有用，因为函数式编程就是通过减少移动的部分让代码更好理解。混合允许你封装一块在应用的其他组件中都可以使用的函数。如果被正确的使用，他们不会改变函数作用域外部的任何东西，所以多次执行，只要是同样的输入你总是能得到一样的值。这真的很强大。

我们有一对不同的组件,他们的作用是切换一个状态布尔值,一个模态框和一个提示框.这些提示框和模态框除了在功能,没有其它共同点:**它们看起来不一样,用法不一样,但是逻辑一样**

```html
<div id="app">
    <App></App>
</div>
<script src="./vue.js"></script>
<script>
    // 全局混入 要格外小心 每次实例创建 都会调用
    Vue.mixin({
        created(){
            console.log('hello from mixin!!');

        }
    })
    // 抽离
    const toggleShow = {
        data() {
            return {
                isShow: false
            }
        },
        methods: {
            toggleShow() {
                this.isShow = !this.isShow
            }
        }
    }
    const Modal = {
        template: `<div v-if='isShow'><h3>模态框组件</h3></div>`,
        data() {
            return {

            }
        },
        mixins:[toggleShow]

    }
    const ToolTip = {
        data() {
            return {
            }
        },
        template: `<div v-if='isShow'><h3>提示组件</h3></div>`,
        mixins:[toggleShow]

    }
    const App = {
        data() {
            return {

            }
        },
        template: `
        <div>
            <button @click='handleModel'>模态框</button>
            <button @click='handleToolTip'>提示框</button>
            <Modal ref='modal'></Modal>
            <ToolTip ref="toolTip"></ToolTip>
        </div>
        `,
        components: {
            Modal,
            ToolTip
        },
        methods: {
            handleModel() {
                this.$refs.modal.toggleShow()
            },
            handleToolTip() {
                this.$refs.toolTip.toggleShow()
            }
        },
    }
    new Vue({
        el: '#app',
        data: {},
        components: {
            App
        },

    })

```

## Vue全家桶-Vue-router&Vuex

### Vue-Router

#### 资料

- [Vue-router](https://router.vuejs.org/zh/)
- [Vuex](https://vuex.vuejs.org/zh/)

#### 介绍

Vue Router 是 [Vue.js](http://cn.vuejs.org/) 官方的路由管理器。它和 Vue.js 的核心深度集成，让构建单页面应用变得易如反掌。包含的功能有：

- 嵌套的路由/视图表
- 模块化的、基于组件的路由配置
- 路由参数、查询、通配符
- 基于 Vue.js 过渡系统的视图过渡效果
- 细粒度的导航控制
- 带有自动激活的 CSS class 的链接
- HTML5 历史模式或 hash 模式，在 IE9 中自动降级
- 自定义的滚动条行为

#### 起步



用 Vue.js + Vue Router 创建单页应用，是非常简单的。使用 Vue.js ，我们已经可以通过组合组件来组成应用程序，当你要把 Vue Router 添加进来，我们需要做的是，将组件 (components) 映射到路由 (routes)，然后告诉 Vue Router 在哪里渲染它们

> 安装
>
> `npm i vue-router -S`
>
> 在main.js中
>
> ```js
> import Vue from 'vue'
> import VueRouter from 'vue-router'
> 
> Vue.use(VueRouter)
> ```
>
> 推荐使用:vue add router 添加插件(记得提前提交)

#### 基本使用

router.js

```js
import Vue from 'vue'
//1.导入
import Router from 'vue-router'
import Home from './views/Home.vue'
import About from './views/About.vue'
//2.模块化机制 使用Router
Vue.use(Router)

//3.创建路由器对象
const router = new Router({
    routes:[{
      path: '/home',
      component: Home
    },
    {
      path: '/about',
      component: About
    }
  ]
})
export default router;
```

main.js

```js
import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false

new Vue({
  // 4.挂载根实例
  router,
  render: h => h(App)
}).$mount('#app')

```

做好以上配置之后

App.vue

```html
<template>
  <div id="app">
    <div id="nav">
      <!-- 使用router-link组件来导航 -->
      <!-- 通过传入to属性指定连接 -->
      <!-- router-link默认会被渲染成一个a标签 -->
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
    </div>
    <!-- 路由出口 -->
    <!-- 路由匹配的组件将被渲染到这里 -->
    <router-view/>
  </div>
</template>
```

打开浏览器.,切换Home和About超链接,查看效果

#### 命名路由

在配置路由的时候,给路由添加名字,访问时就可以动态的根据名字来进行访问

```js
const router = new Router({
    routes:[{
      path: '/home',
      name:"home",
      component: Home
    },
    {
      path: '/about',
      name:'about'
      component: About
    }
  ]
})
```

要链接到一个命名路由，可以给 `router-link` 的 `to` 属性传一个对象：

```html
<router-link :to="{name:'home'}">Home</router-link> |
<router-link :to="{name:'about'}">About</router-link> |
```

#### 动态路由匹配

我们经常需要把某种模式匹配到的所有路由，全都映射到同个组件。例如，我们有一个 `User` 组件，对于所有 ID 各不相同的用户，都要使用这个组件来渲染。那么，我们可以在 `vue-router` 的路由路径中使用“动态路径参数”(dynamic segment) 来达到这个效果

User.vue

```vue
<template>
  <div>
    <h3>用户页面</h3>
  </div>
</template>

<script>
export default {
};
</script>

<style lang="scss" scoped>
</style>
```

路由配置

```js
const router = new Router({
    routes:[
        {
            path: '/user/:id',
            name: 'user',
            component: User,
        },
    ]
})
```

```html
<router-link :to="{name:'user',params:{id:1}}">User</router-link> |

```

访问

http://localhost:8080/user/1

http://localhost:8080/user/2

查看效果

当匹配到路由时,参数值会被设置到this.$route.params,可以在每个组件中使用,于是，我们可以更新 `User` 的模板，输出当前用户的 ID：

```html
<template>
  <div>
    <h3>用户页面{{$route.params.id}}</h3>
  </div>
</template>

```

##### 响应路由参数的变化

提醒一下，当使用路由参数时，例如从 `/user/1 导航到 `/user/2`，**原来的组件实例会被复用**。因为两个路由都渲染同个组件，比起销毁再创建，复用则显得更加高效。**不过，这也意味着组件的生命周期钩子不会再被调用**。

复用组件时，想对路由参数的变化作出响应的话，你可以简单地 watch (监测变化) `$route` 对象：

```js
/*使用watch(监测变化) $route对象
 watch: {
        $route(to, from) {
            console.log(to.params.id);

        }
    }, */
// 或者使用导航守卫
beforeRouteUpdate(to,from,next){
	//查看路由的变化
    //一定要调用next,不然就会阻塞路由的变化
    next();
}

```

##### 404路由

```js
const router = new Router({
    routes:[
        //....
        // 匹配不到路由时,404页面显示
        {
            path: '*',
            component: () => import('@/views/404')
        }
    ]
})

```

当使用*通配符*路由时，请确保路由的顺序是正确的，也就是说含有***通配符*的路由应该放在最后**。路由 `{ path: '*' }` 通常用于客户端 404 错误

当使用一个*通配符*时，`$route.params` 内会自动添加一个名为 `pathMatch` 参数。它包含了 URL 通过*通配符*被匹配的部分：

```js
{
    path: '/user-*',
    component: () => import('@/views/User-admin.vue')
}
this.$route.params.pathMatch // 'admin'

```

##### 匹配优先级

有时候，同一个路径可以匹配多个路由，此时，匹配的优先级就按照路由的定义顺序：谁先定义的，谁的优先级就最高。

#### 查询参数

类似像地址上出现的这种:http://localhos:8080/page?id=1&title=foo

```js
const router = new Router({
    routes:[
        //....
        {
            name:'/page',
            name:'page',
            component:()=>import('@/views/Page.vue')
        }
        
    ]
})

```

```html
 <router-link :to="{name:'page',query:{id:1,title:'foo'}}">User</router-link> |

```

访问http://localhos:8080/page?id=1&title=foo查看Page

Page.vue

```vue
<template>
    <div>
        <h3>Page页面</h3>
        <h3>{{$route.query.userId}}</h3>
    </div>
</template>

<script>
    export default {
        created () {
            //查看路由信息对象
            console.log(this.$route);
        },
    }
</script>

<style lang="scss" scoped>

</style>

```

#### 路由重定向和别名

例子是从 `/ `重定向到 `/home`：

```js
const router = new Router({
    mode: 'history',
    routes: [
        // 重定向
        {
            path: '/',
            redirect: '/home'
        }
        {
        path: '/home',
        name: 'home',
        component: Home
        },
    ]
})

```

重定向的目标也可以是一个命名的路由：

```js
const router = new VueRouter({
  routes: [
    { path: '/', redirect: { name: 'name' }}
  ]
})

```

**别名**

```js
{
    path: '/user/:id',
    name: 'user',
    component: User,
    alias: '/alias'
}

```

起别名,仅仅起起别名 用户访问http://loacalhost:8080/alias的时候,显示User组件

> 别名”的功能让你可以自由地将 UI 结构映射到任意的 URL，而不是受限于配置的嵌套路由结构。

#### 路由组件传参

在组件中使用 `$route` 会使之与其对应路由形成高度耦合，从而使组件只能在某些特定的 URL 上使用，限制了其灵活性。

使用 `props` 将组件和路由解耦：

**取代与 $route 的耦合**

```js
 {
      path: '/user/:id',
      name: 'user',
      component: User,
      props:true
},

```

User.vue

```vue
<template>
<div>
    <h3>用户页面{{$route.params.id}}</h3>
    <h3>用户页面{{id}}</h3>
    </div>
</template>
<script>
    export default{
        //....
        props: {
            id: {
                type: String,
                default: ''
            },
        },
    }
</script>

```

props也可以是个函数

```js
{
      path: '/user/:id',
      name: 'user',
      component: User,
      props: (route)=>({
        id: route.params.id,
        title:route.query.title
      })
      
}

```

User.vue

```vue
<template>
  <div>
    <h3>用户页面{{id}}-{{title}}</h3>
  </div>
</template>

<script>
export default {
    // ...
    props: {
        id: {
            type: String,
            default: ''
        },
        title:{
            type:String
        }
    },
};
</script>


```

#### 编程式导航

除了使用 `<router-link>` 创建 a 标签来定义导航链接，我们还可以借助 router 的实例方法，通过编写代码来实现。

> **注意：在 Vue 实例内部，你可以通过 $router 访问路由实例。因此你可以调用 this.$router.push。**

| 声明式                    | 编程式             |
| ------------------------- | ------------------ |
| `<router-link :to="...">` | `router.push(...)` |

该方法的参数可以是一个字符串路径，或者一个描述地址的对象。例如

```js
// 字符串
this.$router.push('home')

// 对象
this.$router.push({ path: 'home' })

// 命名的路由
this.$router.push({ name: 'user', params: { userId: '123' }})

// 带查询参数，变成 /register?plan=private
this.$.push({ path: 'register', query: { plan: 'private' }})

```

**前进后退**

```js
// 在浏览器记录中前进一步，等同于 history.forward()
router.go(1)

// 后退一步记录，等同于 history.back()
router.go(-1)

// 前进 3 步记录
router.go(3)

// 如果 history 记录不够用，那就默默地失败呗
router.go(-100)
router.go(100)

```

#### 嵌套路由

实际生活中的应用界面，通常由多层嵌套的组件组合而成。同样地，URL 中各段动态路径也按某种结构对应嵌套的各层组件

```js
/user/1/profile                     /user/1/posts
+------------------+                  +-----------------+
| User             |                  | User            |
| +--------------+ |                  | +-------------+ |
| | Profile      | |  +------------>  | | Posts       | |
| |              | |                  | |             | |
| +--------------+ |                  | +-------------+ |
+------------------+                  +-----------------+

```



router.js

```js
{
      path: '/user/:id',
      name: 'user',
      component: User,
      props: ({params,query})=>({
        id: params.id,
        title:query.title
      }),
      children:[
         // 当 /user/:id/profile 匹配成功，
        // Profile 会被渲染在 User 的 <router-view> 中
        {
          path:"profile",
          component: Profile
        },
        // 当 /user/:id/posts 匹配成功，
        // Posts 会被渲染在 User 的 <router-view> 中
        {
          path: "posts",
          component: Posts
        }
      ]
      
}

```

在 `User` 组件的模板添加一个 `<router-view>`：

```html
<template>
  <div>
    <h3>用户页面{{$route.params.id}}</h3>
    <h3>用户页面{{id}}</h3>
    <router-view></router-view>
  </div>
</template>

```

App.vue

```html
<template>
	<div id='app'>
         <!-- 嵌套理由 -->
      <router-link to="/user/1/profile">User/profile</router-link> |
      <router-link to="/user/1/posts">User/posts</router-link> |
    </div>
</template>

```

#### 命名视图

有时候想同时 (同级) 展示多个视图，而不是嵌套展示，例如创建一个布局，有 `sidebar` (侧导航) 和 `main` (主内容) 两个视图，这个时候命名视图就派上用场了

```js
{
      path: '/home',
      name: 'home',
      //注意这个key是components
      components: {
        default: Home, //默认的名字
        main: ()=>import('@/views/Main.vue'),
        sidebar: () => import('@/views/Sidebar.vue')
      }
},

```

App.vue

```html
<router-view/>
<router-view name='main'/>
<router-view name='sidebar'/>

```

#### 导航守卫

“导航”表示路由正在发生改变。

##### 完整的导航解析流程

1. 导航被触发。
2. 在失活的组件里调用离开守卫。
3. 调用全局的 `beforeEach` 守卫。
4. 在重用的组件里调用 `beforeRouteUpdate` 守卫 (2.2+)。
5. 在路由配置里调用 `beforeEnter`。
6. 解析异步路由组件。
7. 在被激活的组件里调用 `beforeRouteEnter`。
8. 调用全局的 `beforeResolve` 守卫 (2.5+)。
9. 导航被确认。
10. 调用全局的 `afterEach` 钩子。
11. 触发 DOM 更新。
12. 用创建好的实例调用 `beforeRouteEnter` 守卫中传给 `next` 的回调函数。

##### 全局守卫

你可以使用`router.beforeEach`注册一个全局前置守卫

```js
const router = new VueRouter({ ... })

router.beforeEach((to, from, next) => {
  // ...
})

```

有个需求,用户访问在浏览网站时,会访问很多组件,当用户跳转到`/notes`,发现用户没有登录,此时应该让用户登录才能查看,应该让用户跳转到登录页面,登录完成之后才可以查看我的笔记的内容,这个时候全局守卫起到了关键的作用

有两个路由 `/notes`和`/login`

router.vue

```js
const router = new VueRouter({
    routes:[
        {
            path: '/notes',
            name: 'notes',
            component: () => import('@/views/Notes')
        },
        {
            path: "/login",
            name: "login",
            component: () => import('@/views/Login')
        },
    ]
})

// 全局守卫
router.beforeEach((to, from, next) => {
    //用户访问的是'/notes'
    if (to.path === '/notes') {
        //查看一下用户是否保存了登录状态信息
        let user = JSON.parse(localStorage.getItem('user'))
        if (user) {
            //如果有,直接放行
            next();
        } else {
            //如果没有,用户跳转登录页面登录
            next('/login')
        }
    } else {
        next();
    }
})

```

Login.vue

```vue
<template>
  <div>
    <input type="text" v-model="username">
    <input type="password" v-model="pwd">
    <button @click="handleLogin">提交</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: "",
      pwd: ""
    };
  },
  methods: {
    handleLogin() {
      // 1.获取用户名和密码
      // 2.与后端发生交互
      setTimeout(() => {
        let data = {
          username: this.username
        };
         //保存用户登录信息
        localStorage.setItem("user", JSON.stringify(data));
        // 跳转我的笔记页面
        this.$router.push({ name: "notes" });
      }, 1000);
    },
   
  }
};
</script>


```

App.vue

```html
<!-- 全局守卫演示 -->
<router-link to="/notes">我的笔记</router-link> |
<router-link to="/login">登录</router-link> |
<button @click="handleLogout">退出</button>

```

```js
export default {
  methods: {
     handleLogout() {
      //删除登录状态信息
      localStorage.removeItem("user");
      //跳转到首页
      this.$router.push('/')
    }
  },
}

```

##### 组件内的守卫

![image-20191205223937794](F:\Python学习笔记\图片\image-20191205223937794.png)

你可以在路由组件内直接定义以下路由导航守卫：

- `beforeRouteEnter`
- `beforeRouteUpdate` (2.2 新增)
- `beforeRouteLeave`

```vue
<template>
  <div>
    <h3>用户编辑页面</h3>
    <textarea name id cols="30" rows="10" v-model="content"></textarea>
    <button @click="saveData">保存</button>
    <div class="wrap" v-for="(item,index) in list" :key="index">
      <p>{{item.title}}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      content: "",
      list: [],
      confir: true
    };
  },
  methods: {
    saveData() {
        this.list.push({
          title: this.content
        });
        this.content = "";
      }

  },
  beforeRouteLeave(to, from, next) {
    // 导航离开该组件的对应路由时调用
    // 可以访问组件实例 `this`
    if (this.content) {
      alert("请确保保存信息之后,再离开");
      next(false);
    } else {
      next();
    }
  }
};
</script>

```

##### 路由元信息实现权限控制

给需要添加权限的路由设置meta字段

```js
{
      path: '/blog',
      name: 'blog',
      component: () => import('@/views/Blog'),
      meta: {
        requiresAuth: true
}
},
{
      // 路由独享的守卫
      path: '/notes',
      name: 'notes',
      component: () => import('@/views/Notes'),
      meta: {
        requiresAuth: true
      }
},

```

```js
// 全局守卫
router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    // 需要权限
    if(!localStorage.getItem('user')){
      next({
        path:'/login',
        query:{
          redirect:to.fullPath
        }
      })
    }else{
      next();
    }

  } else {
    next();
  }
})

```

login.vue

```js
//登录操作
handleLogin() {
    // 1.获取用户名和密码
    // 2.与后端发生交互
    setTimeout(() => {
        let data = {
            username: this.username
        };
        localStorage.setItem("user", JSON.stringify(data));
        // 跳转到之前的页面
        this.$router.push({path: this.$route.query.redirect });
    }, 1000);
}

```

##### 数据获取

有时候，进入某个路由后，需要从服务器获取数据。例如，在渲染用户信息时，你需要从服务器获取用户的数据。我们可以通过两种方式来实现：

- **导航完成之后获取**：先完成导航，然后在接下来的组件生命周期钩子中获取数据。在数据获取期间显示“加载中”之类的指示。
- **导航完成之前获取**：导航完成前，在路由进入的守卫中获取数据，在数据获取成功后执行导航。

###### 导航完成后获取数据

当你使用这种方式时，我们会马上导航和渲染组件，然后在组件的 `created` 钩子中获取数据。这让我们有机会在数据获取期间展示一个 loading 状态，还可以在不同视图间展示不同的 loading 状态。

```vue
<template>
  <div class="post">
    <div v-if="loading" class="loading">Loading...</div>

    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="post" class="content">
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
    </div>
  </div>
</template>

```

```js
export default {
  name: "Post",
  data() {
    return {
      loading: false,
      post: null,
      error: null
    };
  },
    // 组件创建完后获取数据，
    // 此时 data 已经被 监视 了
  created() {
     // 如果路由有变化，会再次执行该方法
    this.fetchData();
  },
  watch: {
    $route: "fetchData"
  },
  methods: {
    fetchData() {
      this.error = this.post = null;
      this.loading = true;
      this.$http.get('/api/post')
      .then((result) => {
          this.loading = false;
          this.post = result.data;
      }).catch((err) => {
          this.error = err.toString();
      });
    }
  }
};

```

### Vuex

Vuex 是一个专为 Vue.js 应用程序开发的**状态管理模式**。它采用集中式存储管理应用的所有组件的状态，并以相应的规则保证状态以一种可预测的方式发生变化

![image-20191008152839677](/Users/majinju/Desktop/备课/前端架构课/Vue/assets/image-20191008152839677.png)

#### 安装vuex

```js
vue add vuex

```

store.js

```js
import Vue from 'vue'
import Vuex from 'vuex'
//确保开头调用Vue.use(Vuex)
Vue.use(Vuex)

export default new Vuex.Store({
  state: { //this.$store.state.count
    count:0
  },
  getters:{
    evenOrOdd:(state)=>{ //this.$store.getters.evenOrOdd
      return state.count % 2 ===0 ? '偶数': '奇数'
    }
  },
  mutations: { 
    increment(state){ //this.$store.commit('increment')
      state.count++
    },
    decrement(state){ //this.$store.commit('decrement')
      state.count--
    }
  },
  actions: {
    increment({commit}){  //this.$store.dispatch('increment')
      // 修改状态的唯一方式是提交mutation
      commit('increment');
    },
    decrement({ commit }) { //this.$store.dispatch('decrement')
      commit('decrement');
    },
    incrementAsync({commit}){ //this.$store.dispatch('incrementAsync')
       return new Promise((resolve, reject) => {
        setTimeout(() => {
          commit('increment');
          resolve(10);
        }, 1000);
      })
    }
  }
})

```

我们可以在组件的某个合适的时机通过`this.$store.state`来获取状态对象,以及通过`this.$store.commit`方法触犯状态变更

```js
this.$store.commit('increment');

```

#### mapState辅助函数

当一个组件需要获取多个状态时候，将这些状态都声明为计算属性会有些重复和冗余。为了解决这个问题，我们可以使用 `mapState` 辅助函数帮助我们生成计算属性，让你少按几次键

```js
// 在单独构建的版本中辅助函数为 Vuex.mapState
import { mapState } from 'vuex'

export default {
  // ...
  computed: mapState({
    // 箭头函数可使代码更简练
    count: state => state.count,

    // 传字符串参数 'count' 等同于 `state => state.count`
    countAlias: 'count',

    // 为了能够使用 `this` 获取局部状态，必须使用常规函数
    countPlusLocalState (state) {
      return state.count + this.localCount
    }
  })
}

```

当映射的计算属性的名称与 state 的子节点名称相同时，我们也可以给 `mapState` 传一个字符串数组。

```js
computed: mapState([
  // 映射 this.count 为 store.state.count
  'count'
])

```



**对象展开运算符**

`mapState` 函数返回的是一个对象。我们如何将它与局部计算属性混合使用呢？通常，我们需要使用一个工具函数将多个对象合并为一个，以使我们可以将最终对象传给 `computed` 属性。但是自从有了对象展开运算符,极大地简化写法

```js
computed:{
    ...mapState({
       "count"
    })
}

```

#### mapGetters辅助函数

`mapGetters` 辅助函数仅仅是将 store 中的 getter 映射到局部计算属性：

```js
import { mapGetters } from 'vuex'

export default {
  // ...
  computed: {
     ...mapGetters([
       'evenOrOdd'
    ])
  },
}

```

如果你想将一个 getter 属性另取一个名字，使用对象形式：

```js
mapGetters({
  // 把 `this.doneEvenOrOdd` 映射为 `this.$store.getters.evenOrOdd`
  doneEvenOrOdd: 'evenOrOdd'
})

```

**Mutation**

更改 Vuex 的 store 中的状态的唯一方法是提交 mutation。Vuex 中的 mutation 非常类似于事件：每个 mutation 都有一个字符串的 **事件类型 (type)** 和 一个 **回调函数 (handler)**。这个回调函数就是我们实际进行状态更改的地方，并且它会接受 state 作为第一个参数：

#### MapMutation

你可以在组件中使用 `this.$store.commit('xxx')` 提交 mutation，或者使用 `mapMutations` 辅助函数将组件中的 methods 映射为 `store.commit` 调用（需要在根节点注入 `store`）。

```js
import { mapMutations } from 'vuex'

export default {
  // ...
  methods: {
   ...mapMutations('counter',[
      'increment',
      'decrement',
    ]),
  }
}

```

**Action**

Action 类似于 mutation，不同在于：

- Action 提交的是 mutation，而不是直接变更状态。
- Action 可以包含任意异步操作

#### MapAction辅助函数

```js
import { mapMutations } from 'vuex'

export default {
  // ...
  methods: {
    ...mapActions('counter',[
      'incrementAsync'
    ])
  }
}

```

**提交方式**

```js
//在组件内部
// 以载荷形式分发
this.$store.dispatch('incrementAsync', {
  amount: 10
})

// 以对象形式分发
this,.$store.dispatch({
  type: 'incrementAsync',
  amount: 10
})

```

#### Module

由于使用单一状态树，应用的所有状态会集中到一个比较大的对象。当应用变得非常复杂时，store 对象就有可能变得相当臃肿。

为了解决以上问题，Vuex 允许我们将 store 分割成**模块（module）**。每个模块拥有自己的 state、mutation、action、getter、甚至是嵌套子模块——从上至下进行同样方式的分割：

做一个购物车案例

有两个模块`cart`和`products`

创建store文件夹

```tex
|---store
    ├── index.js
    └── modules
        ├── cart.js
        └── products.js

```

cart.js

如果希望你的模块具有更高的封装度和复用性，你可以通过添加 `namespaced: true` 的方式使其成为带命名空间的模块

当模块被注册后，它的所有 getter、action 及 mutation 都会自动根据模块注册的路径调整命名。

```js
export default {
    //使当前模块具有更高的封装度和复用性
    namespaced: true,
    state: {
     ...
    },
    getters: {
       ...
    },
    mutations: {
       ...
    },
    actions: {
       ...
    },
}

```

products.js

```js
export default {
    //使当前模块具有更高的封装度和复用性
    namespaced: true,
    state: {
        ...
    },
    getters: {
	   ...
    },
    mutations: {
       ...
    },
    actions: {
       ...
    },
}   

```

index.js

```js
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
import cart from './modules/cart';
import products from './modules/products';
export default new Vuex.Store({
    modules:{
        cart,
        products,
    }
})
//this.$store.state.cart //获取cart的状态
//this.$store.state.products //获取products的状态

```

**完整购物车案例**

mock数据

新建vue.config.js

```js
const products = [
    { id: 1, title: 'iphone11', price: 600, inventory: 10 },
    { id: 2, title: 'iphone11 pro', price: 800, inventory: 5 },
    { id: 3, title: 'iphone11 max', price: 1600, inventory: 6 },
]
module.exports = {
    devServer: {
        before(app, server) {
            app.get('/api/products', (req, res) => {
                res.json({
                    products:products
                })
            })
        }
    }
}

```

cart.js

```js
export default {
    //使当前模块具有更高的封装度和复用性
    namespaced: true,
    state: {
        items: [],
    },
    getters: {
        //获取购物车中的商品
        cartProducts: (state, getters, rootState) => {
            return state.items.map(({ id, quantity }) => {
                const product = rootState.products.products.find(product => product.id === id)
                return {
                    title: product.title,
                    price: product.price,
                    quantity
                }
            })
        },
        // 购物车总价格
        cartTotalPrice: (state, getters) => {
            return getters.cartProducts.reduce((total, product) => {
                return total + product.price * product.quantity
            }, 0)
        }

    },
    mutations: {
        pushProductToCart(state, { id }) {
            state.items.push({
                id,
                quantity: 1
            })
        },
        incrementItemQuantity(state, { id }) {
            const cartItem = state.items.find(item => item.id === id);
            cartItem.quantity++;
        },
    },
    actions: {
        //添加商品到购物车
        addProductToCart({ commit, state }, product) {
            // 如果有库存
            if (product.inventory > 0) {
                const cartItem = state.items.find(item => item.id === product.id);
                if (!cartItem) {
                    commit('pushProductToCart', { id: product.id });
                } else {
                    commit('incrementItemQuantity', cartItem);
                }
                //提交products模块中decrementProductInventory方法
                //让商品列表的库存数量减1
                commit('products/decrementProductInventory', { id: product.id }, { root: true })
            }

        }
    },
}

```

products.js

```js
import Axios from "axios";

export default {
    //使当前模块具有更高的封装度和复用性
    namespaced: true,
    state: {
        products: []
    },
    getters: {

    },
    mutations: {
        setProducts(state, products) {
            state.products = products;
        },
        //减少商品库存的方法
        decrementProductInventory(state, { id }) {
            const product = state.products.find(product => product.id === id)
            product.inventory--
        }
    },
    actions: {
        //获取所有商品的方法
        getAllProducts({ commit }) {
            Axios.get('/api/products')
                .then(res => {
                    console.log(res.data.products);
                    commit('setProducts',res.data.products)
                })
                .catch(err => {
                    console.log(err);

                })
        }
    },
}   

```

Products.vue

```vue
<template>
<div>
    <h3>商铺</h3>
    <ul>
        <li v-for='product in products' :key = 'product.id'>
            {{product.title}} - {{product.price | currency}}
            <br>
            <button :disabled='!product.inventory' @click='addProductToCart(product)'>添加到购物车</button>
    	</li>
    </ul>
    <hr>
    </div>
</template>

<script>
    import { mapState,mapActions } from "vuex";
    export default {
        name: "ProductList",
        data() {
            return {};
        },
        computed: {
            products(){
                return this.$store.state.products.products
            }
        },
        methods: {
            ...mapActions('cart',[
                'addProductToCart'
            ])
        },
        created() {
            this.$store.dispatch("products/getAllProducts");
        }
    };
</script>

<style scoped>
</style>

```

Cart.vue

```vue
<template>
<div>
    <h2>我的购物车</h2>
    <i>请增加商品到您的购物车.</i>
    <ul>
        <li
            v-for="product in products"
            :key="product.id"
            >{{product.title}}-{{product.price | currency}} x {{product.quantity}}
    	</li>
    </ul>
    <p>总价格:{{total | currency}}</p>
    </div>
</template>

<script>
    import { mapGetters,mapState } from "vuex";
    export default {
        name: "shoppingcart",
        computed:{
            ...mapGetters('cart',{
                products:'cartProducts',
                total:'cartTotalPrice'
            })
        }
    };
</script>

<style scoped>
</style>

```



#### 什么情况下我应该使用 Vuex？

Vuex 可以帮助我们管理共享状态，并附带了更多的概念和框架。这需要对短期和长期效益进行权衡。

如果您不打算开发大型单页应用，使用 Vuex 可能是繁琐冗余的。确实是如此——如果您的应用够简单，您最好不要使用 Vuex。一个简单的 [store 模式](https://cn.vuejs.org/v2/guide/state-management.html#%E7%AE%80%E5%8D%95%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86%E8%B5%B7%E6%AD%A5%E4%BD%BF%E7%94%A8)就足够您所需了。但是，如果您需要构建一个中大型单页应用，您很可能会考虑如何更好地在组件外部管理状态，Vuex 将会成为自然而然的选择。引用 Redux 的作者 Dan Abramov 的话说就是：

> Flux 架构就像眼镜：您自会知道什么时候需要它