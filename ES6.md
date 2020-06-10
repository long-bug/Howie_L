[TOC]

### 块级绑定

let和const

let 声明的变量:1.块级作用域 2.不允许重复声明

```js
// var声明的变量会有变量提升
console.log(a);
var  a = 2;

// let声明的变量不会有变量提升，是一个块作用域的
console.log(a); //报错
let a = 2;

let c = 10;
let c = 30;
console.log(c); //报错
```

const声明的变量被认为是常量，一旦被赋值以后无法改变。所以const声明变量时立马赋值

const声明的变量也为块级作用域

```js
const max = 30;
max = 40;

const min;

if(2===2){
    const name = 'mjj';
}
console.log(name);

//可以修改变量成员
const person = {
    name:'小马哥'
}
person.name = 'alex';
console.log(person);//{name:'小马哥'}
```

应用：看个for循环的例子

```js
var arr = []
for(var i = 0; i < 10; i++){
    arr[i] = function () {
        return i;
    }
}
console.log(arr[5]()); //10
```

以前的解决方案：

```js
arr[i] = (function(n) {
    return function () {
        return n;
    }
})(i)
```

现在完全可以将**var改成let来解决**

使用let声明的变量不会影响全局污染

```js
let RegExp = 10;
console.log(RegExp);
console.log(window.RegExp);
```

建议：

```js
关于let和const在以后的开发中最佳应用：
在默认情况下用const,而只有你在知道变量值需要被修改的情况下使用let
```

### 模板字符串：解决了拼接字符串的繁琐

以前的操作

```js
const oBox = document.querySelector('.box');
// 模板字符串
const id = 1;
const name = 'mjj';
const htmlTel = "<ul><li><p>id:" + id + "</p><p>name:" + name + "</p></li></ul>";
oBox.innerHTML = htmlTel;
```

ES6操作使用模板字符串

```js
const htmlTel = `<ul>
<li>
<p>id:${id}</p>
<p>name:${name}</p>
</li>
</ul>`
```

### 函数

1. 参数默认值的函数

   ```js
   // 之前的es5的写法
   function add(a,b) {
       a = a || 10;
       b = b || 20;
       return a + b;
   }
   console.log(add());
   
   //es6写法
   //参数的默认值 不会影响arguments对象,它表示实参的个数
   function add(a, b = 20) {
       console.log(arguments);
       return a + b;
   }
   console.log(add(10))
   ```

2. 默认的表达式可以是一个函数

   ```js
   function getVal(val) {
       return val + 5;
   }
   
   function add2(a, b = getVal(5)) {
       return a + b;
   }
   console.log(add2(10));
   ```

3. 箭头函数

    使用`=>`来定义 `function(){}` 等价于` ()=>{}`

   ```js
   let add = function(value,value2) {
       return value + value2;
   } 
   // 箭头函数
   // 有一个参数
   // let add = value => value;
   
   // 有两个参数
   // let add = (value,value2) => value+value2;
   
   /* let add = (value1,value2)=>{
           return value1 + value2;
       } */
   
   // 无参数
   let fn = () => "hello world";
   
   let doThing = () => {
   
   }
   //返回对象
   let getId = id =>{
       return {
           id: id,
           name: 'mjj'
       }
   }
   //更简洁
   let getId = id => ({id: id,name: 'mjj'})
   const obj = getId(1);
   console.log(obj);
   
   //闭包函数
   /*let fn2 = (function () {
       return function () {
           console.log('hello world');
   
       }
   })();*/ 
   let fn2 = (() => {
       return () => {
           console.log('hello world');
   
       }
   })();
   fn2();
   ```

4. 没有this绑定

   > js犯错最多的就是函数中this的绑定，由于函数内部的this值能被改变，这取决于调用该函数的上下文对象

   ```js
   let PageHandler = {
       id:123,
       init:function(){
           document.addEventListener('click',function(event) {
               this.doSomeThings(event.type);
           },false);
       },
       doSomeThings:function(type){
           console.log(`事件类型:${type},当前id:${this.id}`);
       }
   }
   PageHandler.init();
   ```

   之前的解决方案

   ```js
   let PageHandler = {
       id: 123,
       init: function () {
           // 使用bind来改变内部函数this的指向
           document.addEventListener('click', function (event) {
               this.doSomeThings(event.type);
           }.bind(this), false);
       },
       doSomeThings: function (type) {
           console.log(`事件类型:${type},当前id:${this.id}`);
       }
   }
   PageHandler.init();
   ```

   es6箭头函数的解决方案

   ```js
   let PageHandler = {
       id: 123,
       init: function () {
           // 箭头函数没有this的指向，箭头函数内部的this值只能通过查找作用域链来确定
           // 如果箭头函数被一个非箭头函数所包括，那么this的值与该函数的所属对象相等，否则 则是全局的window对象
           document.addEventListener('click', (event) => {
               console.log(this);
               this.doSomeThings(event.type);
           }, false);
       },
       doSomeThings: function (type) {
           console.log(`事件类型:${type},当前id:${this.id}`);
       }
   }
   PageHandler.init()
   ```

   > 1. 箭头函数的注意事项
   >
   > ​    箭头函数中没有arguments对象   
   >
   >     ```js
   > var getVal = (a,b) => {
   >     // console.log(arguments)
   >     return a + b;
   > }
   > console.log(getVal(1,2)); 
   >     ```
   >
   >   2.箭头函数不能使用new关键字来实例化对象
   >
   > ```js
   > let Person = ()=>{}
   > var p1 = new Person(); 
   > ```
   >
   > 

### 扩展的对象功能

es6允许直接写入变量和函数，作为对象的属性和方法

1. 属性的简洁表示法

   ```js
   const name = '张三';
   const age = 19;
   const person = {
       name,
       age,
       // 方法也可以简写
       sayName() {
           console.log(this.name);
       }
   }
   person.sayName()
   
   
   ```

   问：

   ```js
   function fn(x,y) {
       return {x,y}
   } 
   fn(1,2);//结果是多少？
   ```

2. `assign()`方法

   此方法用于对象的合并,将源对象的所有可枚举属性赋值到目标对象中



### 解构赋值

解构赋值时对赋值运算符的一种扩展,它通常针对数组或者对象进行操作.优点：代码书写上简洁且易读

1. 对象解构

   ```js
   let node = {
       type:'identifier',
       name:'foo'
   }
   let {type,name} = node;
   console.log(type,name)
   
   let obj = {
       a:{
           name:'张三'
       },
       b:[],
       c:'hello world'
   }
   //可忽略
   let {a} = obj;
   //剩余运算符
   let {a,...res} = obj;
   console.log(a,res);
   
   // 默认值
   let {e,f = 10} = {e:20};
   console.log(e,f);
   ```

2. 数组解构

   ```js
   let arr = [1,2,3];
   // 将以上数组解构
   let [a,b,c] = [1,2,3];
   
   // 可嵌套
   let [a,[b],c] = [1,[2],[3]];
   // 可忽略
   let [a,b] = [1,2,3,4,5];
   console.log(a,b);
   
   // 解构赋值默认值
   let [a,b,c,d,e,f=10] = 'hello';
   console.log(a,b,c,d,e,f);
   ```

### Class类

es5的写法

```js
function Person(name,age) {
    this.name = name;
    this.age = age;
}
Person.prototype.sayName  = function() {
    return this.sayName;
}
let p = new Person('mjj',18);
console.log(p);
```

es6的写法

```js
class Person {
    // constructor方法 是类的默认方法,通过new命令生成对象实例时,自动调用该方法,一个类必须有constructor方法,如果没有定义,会被默认添加
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    sayName(){
        return this.name;
    }
    sayAge(){
        return this.age;
    } 
}
```

以下两个内容，后面讲解

### Promise和异步编程

### 模块化



