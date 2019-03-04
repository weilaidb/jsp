console.log("================begin ===============");
console.log("================begin ===============");
console.log("================begin ===============");

'use strict';

// alert('你开始学习了吗？');

// var age = 15;
// if (age >= 18) {
//     alert('adult');
// } else {
//     alert('teenager');
// }


var x = 100;
console.log(x);


console.log(`多行
字符串
测试`);



// 如果浏览器支持模板字符串，将会替换字符串内部的变量:
var name = '小明';
var age = 20;

console.log(`你好, ${name}, 你今年${age}岁了!`);


var s = 'Hello, world!';
s.length; // 13
console.log(s.length)


var s = 'Hello, world!';

console.log(s[0]); // 'H'
console.log(s[6]); // ' '
console.log(s[7]); // 'w'
console.log(s[12]); // '!'
console.log(s[13]); // undefined 超出范围的索引不会报错，但一律返回undefined


// var s = 'Test';
// // s[0] = 'X';
// alert(s); // s仍然为'Test'
//

var s = 'Hello';
s.toUpperCase(); // 返回'HELLO'
console.log(s.toUpperCase());

var s = 'Hello';
var lower = s.toLowerCase(); // 返回'hello'并赋值给变量lower
lower; // 'hello'
console.log(lower);


var s = 'hello, world';
s.indexOf('world'); // 返回7
s.indexOf('World'); // 没有找到指定的子串，返回-1
console.log(s.indexOf('world'));
console.log(s.indexOf('hello'));


var s = 'hello, world'
s.substring(0, 5); // 从索引0开始到5（不包括5），返回'hello'
s.substring(7); // 从索引7开始到结束，返回'world'
console.log(s.substring(0,5));
console.log(s.substring(7));



document.write("Hello World!")



document.write("<h1>Hello World!</h1>")
document.write("<h1>Hello World!</h1>")
document.write("<h1>Hello World!</h1>")


function message()
{
    // alert("该提示框是通过 onload 事件调用的。")
}


function myFunction()
{
    document.getElementById("demo").innerHTML="My First JavaScript Function";
}



document.write("<h1>This is a heading</h1>");
document.write("<p>This is a paragraph</p>");


function disp_alert()
{
    alert("我是警告框！！")
}


function disp_alert_enter()
{
    alert("再次向您问好！在这里，我们向您演示" + '\n' + "如何向警告框添加折行。")
}

function show_confirm()
{
    var r=confirm("Press a button!");
    if (r==true)
    {
        alert("You pressed OK!");
    }
    else
    {
        alert("You pressed Cancel!");
    }
}

function disp_prompt()
{
    var name=prompt("请输入您的名字","Bill Gates")
    if (name!=null && name!="")
    {
        document.write("你好！" + name + " 今天过得怎么样？")
    }
}

function myfunction()
{
    alert("您好！")
}


function myfunction(txt)
{
    alert(txt)
}


function myFunction2()
{
    return ("您好，祝您愉快！")
}

function product(a,b)
{
    return a*b
}


console.log("================end ===============");
console.log("==========fdfd======end ===============");
console.log("================end ===============");
