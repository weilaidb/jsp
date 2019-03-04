<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/3
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>学习javascript</title>
    <%--<script type="text/javascript">--%>
    <%--alert('我要学JavaScript!');--%>
    <%--</script>--%>
    <script src="/javascript/file/abc.js">
    </script>


</head>


<body onload="detectBrowser()">


<div>
    <input type="text" id="ipt" placeholder="输入要复制的东西"/> <br/><br/>
    <button id="btnxx">复制</button>
</div>
<style type="text/css">
    html, body {
        margin: 0;
    }

    div {
        padding: 40px;
    }

    input {
        width: 240px;
        height: 40px;
        line-height: 40px;
        font-size: 14px;
        border: none;
        background-color: #eee;
        border-radius: 4px;
        text-indent: 4px;
        outline: none;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }

    button {
        width: 140px;
        height: 50px;
        border: none;
        border-radius: 4px;
        outline: none;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        cursor: pointer;
    }
</style>


<script type="text/javascript">

    // 复制的方法
    function copyText(text, callback) { // text: 要复制的内容， callback: 回调
        var tag = document.createElement('input');
        tag.setAttribute('id', 'cp_hgz_input');
        tag.value = text;
        document.getElementsByTagName('body')[0].appendChild(tag);
        document.getElementById('cp_hgz_input').select();
        document.execCommand('copy');
        document.getElementById('cp_hgz_input').remove();
        if (callback) {
            callback(text)
        }
    }

    // 点击按钮调用复制
    document.getElementById('btnxx').onclick = function () {
        var texts = document.getElementById('ipt').value
        copyText(texts, function () {
            // alert('复制成功 \n复制内容内容' + texts)
        })
    }

</script>


<script type="text/javascript">
    function copyUrl2() {
        var Url2 = document.getElementById("biao1").innerText;
        var oInput = document.createElement('input');
        oInput.value = Url2;
        document.body.appendChild(oInput);
        oInput.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        oInput.className = 'oInput';
        oInput.style.display = 'none';
        // alert('复制成功');
        console.log('复制成功。。。。');
    }
</script>
<div cols="20" id="biao1">12345678</div>
<input type="button" onClick="copyUrl2()" value="点击复制代码"/>


<button id="btn">复制</button>

<script type="text/javascript">

    // 复制的方法
    function copyText(text, callback) { // text: 要复制的内容， callback: 回调
        var tag = document.createElement('input');
        tag.setAttribute('id', 'cp_hgz_input');
        tag.value = text;
        document.getElementsByTagName('body')[0].appendChild(tag);
        document.getElementById('cp_hgz_input').select();
        document.execCommand('copy');
        document.getElementById('cp_hgz_input').remove();
        if (callback) {
            callback(text)
        }
    }

    // 点击按钮调用复制
    document.getElementById('btn').onclick = function () {
        copyText('123456', function () {
            console.log('复制成功')
        })
    }

</script>


<textarea>请输入内容hellip;</textarea>
<input type="button" value="插入str" onClick="test('1234564545');"/>
<p>string.substring(from, to)<br/>string.slice(start, end)<br/>这两个方法差不多，都是指定开始和结束位置返回新字符串，在参数均为正整数的时候返回结果一样，当参数为负整数的时候，string.substring(from,
    to)把负整数都当作0处理，而string.slice(start, end)将把负整数加上该字符串的长度处理<br/>string.substr(start, length)<br/>这个方法只在第二个参数上指定的是新字符串的长度，对于负正数和string.slice(start,
    end)处理一样，把负整数加上原字符串的长度</p>
<script>
    function test(str) {
        var el = document.getElementsByTagName('textarea')[0];
        var len = el.value.length;
        clipboadtext = document.createRange().cloneContents();
        el.focus();
//只ie认document.selection
        if (!document.selection) {
//不会替换选中文本，光标处插入，插入后光标定位到了文本末
//             alert(el.selectionStart);
            el.value = el.value.substr(0, el.selectionStart) + str + el.value.substring(el.selectionStart, len);
            // alert(el.selectionStart);
        } else {
//替换选中文本，光标处插入，插入后光标停留在了原位置
            document.selection.createRange().text = str;
        }
    }
</script>

<p>

</p>

<%--<script type="text/javascript">--%>
<%--document.body.oncopy = function () {--%>
<%--event.returnValue = false;--%>
<%--// document.selection.createRange().text;--%>
<%--var txt_cr = document.selection.createRange().text;--%>
<%--var copy_cr = "本文来自我爱开发网, 原文地址：http://www.5idev.cn/p-javascript_oncopy.shtml";--%>
<%--clipboardData.setData('Text', txt_cr + 'rn' + copy_cr + 'rn');--%>
<%--}--%>
<%--</script>--%>
<%--<p>这是一些文字</p>--%>


<input type="text" value="文字内容" oncut="alert('文字已被剪切！')"/>

<%--<input type="text" onpaste="return false;" />--%>


<script type="text/javascript">

    function person(firstname, lastname, age, eyecolor) {
        this.firstname = firstname
        this.lastname = lastname
        this.age = age
        this.eyecolor = eyecolor
    }

    myFather = new person("John", "Adams", 35, "black")

    document.write(myFather.firstname + " 的年龄是 " + myFather.age + " 岁。")

</script>


<script type="text/javascript">
    var c = 0
    var t

    function timedCount() {
        document.getElementById('txt').value = c
        c = c + 1
        t = setTimeout("timedCount()", 1000)
    }
</script>
<form>
    <input type="button" value="开始计时！" onClick="timedCount()">
    <input type="text" id="txt">
</form>

<p>请点击上面的按钮。输入框会从 0 开始一直进行计时。</p>


<script type="text/javascript">
    function timedText() {
        var t1 = setTimeout("document.getElementById('txt').value='2 秒'", 2000)
        var t2 = setTimeout("document.getElementById('txt').value='4 秒'", 4000)
        var t3 = setTimeout("document.getElementById('txt').value='6 秒'", 6000)
    }
</script>


<form>
    <input type="button" value="显示计时的文本" onClick="timedText()">
    <input type="text" id="txt">
</form>

<p>点击上面的按钮。输入框会显示出已经逝去的时间（2、4、6 秒）。</p>


<script type="text/javascript">
    function timedMsg() {
        var t = setTimeout("alert('5 秒！')", 5000)
    }
</script>


<form>
    <input type="button" value="显示定时的警告框" onClick="timedMsg()">
</form>
<p>请点击上面的按钮。警告框会在 5 秒后显示。</p>


<script type="text/javascript">
    function mouseOver() {
        document.b1.src = "/i/eg_mouse.jpg"
    }

    function mouseOut() {
        document.b1.src = "/i/eg_mouse2.jpg"
    }
</script>

<a href="/index.html" target="_blank">
    <img border="0" alt="Visit W3School!" src="/i/eg_mouse2.jpg" name="b1" onmouseover="mouseOver()"
         onmouseout="mouseOut()"/></a>


<%--<body onload="message()">--%>

<script type="text/javascript">
    function getCookie(c_name) {
        if (document.cookie.length > 0) {
            c_start = document.cookie.indexOf(c_name + "=")
            if (c_start != -1) {
                c_start = c_start + c_name.length + 1
                c_end = document.cookie.indexOf(";", c_start)
                if (c_end == -1) c_end = document.cookie.length
                return unescape(document.cookie.substring(c_start, c_end))
            }
        }
        return ""
    }

    function setCookie(c_name, value, expiredays) {
        var exdate = new Date()
        exdate.setDate(exdate.getDate() + expiredays)
        document.cookie = c_name + "=" + escape(value) +
            ((expiredays == null) ? "" : "; expires=" + exdate.toGMTString())
    }

    function checkCookie() {
        username = getCookie('username')
        if (username != null && username != "") {
            alert('Welcome again ' + username + '!')
        } else {
            username = prompt('Please enter your name:', "")
            if (username != null && username != "") {
                setCookie('username', username, 365)
            }
        }
    }
</script>


<script type="text/javascript">
    function detectBrowser() {
        var browser = navigator.appName
        var b_version = navigator.appVersion
        var version = parseFloat(b_version)
        if ((browser == "Netscape" || browser == "Microsoft Internet Explorer") && (version >= 4)) {
            // alert("您的浏览器够先进了！")
        } else {
            // alert("是时候升级您的浏览器了！")
        }
    }
</script>
</head>


<script type="text/javascript">
    var x = navigator;
    document.write("CodeName=" + x.appCodeName);
    document.write("<br />");
    document.write("MinorVersion=" + x.appMinorVersion);
    document.write("<br />");
    document.write("Name=" + x.appName);
    document.write("<br />");
    document.write("Version=" + x.appVersion);
    document.write("<br />");
    document.write("CookieEnabled=" + x.cookieEnabled);
    document.write("<br />");
    document.write("CPUClass=" + x.cpuClass);
    document.write("<br />");
    document.write("OnLine=" + x.onLine);
    document.write("<br />");
    document.write("Platform=" + x.platform);
    document.write("<br />");
    document.write("UA=" + x.userAgent);
    document.write("<br />");
    document.write("BrowserLanguage=" + x.browserLanguage);
    document.write("<br />");
    document.write("SystemLanguage=" + x.systemLanguage);
    document.write("<br />");
    document.write("UserLanguage=" + x.userLanguage);
</script>


<p></p>


<script type="text/javascript">
    document.write("<p>浏览器：")
    document.write(navigator.appName + "</p>")

    document.write("<p>浏览器版本：")
    document.write(navigator.appVersion + "</p>")

    document.write("<p>代码：")
    document.write(navigator.appCodeName + "</p>")

    document.write("<p>平台：")
    document.write(navigator.platform + "</p>")

    document.write("<p>Cookies 启用：")
    document.write(navigator.cookieEnabled + "</p>")

    document.write("<p>浏览器的用户代理报头：")
    document.write(navigator.userAgent + "</p>")
</script>

<p></p>


<script type="text/javascript">
    var browser = navigator.appName
    var b_version = navigator.appVersion
    var version = parseFloat(b_version)
    document.write("浏览器名称：" + browser)
    document.write("<br />")
    document.write("浏览器版本：" + version)
</script>

<p></p>


<script type="text/javascript">
    onerror = handleErr
    var txt = ""

    function handleErr(msg, url, l) {
        txt = "本页中存在错误。\n\n"
        txt += "错误：" + msg + "\n"
        txt += "URL: " + url + "\n"
        txt += "行：" + l + "\n\n"
        txt += "点击“确定”继续。\n\n"
        alert(txt)
        return true
    }

    function message333() {
        adddlert("Welcome guest!")
    }
</script>


<input type="button" value="查看消息333" onclick="message333()"/>


<%--<script type="text/javascript">--%>
<%--var x=prompt("请输入 0 至 10 之间的数：","")--%>
<%--try--%>
<%--{--%>
<%--if(x>10)--%>
<%--throw "Err1"--%>
<%--else if(x<0)--%>
<%--throw "Err2"--%>
<%--else if(isNaN(x))--%>
<%--throw "Err3"--%>
<%--}--%>
<%--catch(er)--%>
<%--{--%>
<%--if(er=="Err1")--%>
<%--alert("错误！该值太大！")--%>
<%--if(er == "Err2")--%>
<%--alert("错误！该值太小！")--%>
<%--if(er == "Err3")--%>
<%--alert("错误！该值不是数字！")--%>
<%--}--%>
<%--</script>--%>


<script type="text/javascript">
    var txt = ""

    function messagexx() {
        try {
            adddlert("Welcome guest!")
        } catch (err) {
            txt = "本页中存在错误。\n\n"
            txt += "点击“确定”继续查看本页，\n"
            txt += "点击“取消”返回首页。\n\n"
            if (!confirm(txt)) {
                document.location.href = "/index.jsp"
            }
        }
    }
</script>

<input type="button" value="查看消息" onclick="messagexx()"/>


<script type="text/javascript">
    var txt = ""

    function message2() {
        try {
            adddlert("Welcome guest!")
        } catch (err) {
            txt = "本页中存在错误。\n\n"
            txt += "错误描述：" + err.description + "\n\n"
            txt += "点击“确定”继续。\n\n"
            alert(txt)
        }
    }
</script>

<%--<input type="button" value="查看消息" onclick="message2()" />--%>


<p></p>
<p></p>
<script type="text/javascript">
    var x
    var mycars = new Array()
    mycars[0] = "宝马"
    mycars[1] = "奔驰"
    mycars[2] = "宾利"

    for (x in mycars) {
        document.write(mycars[x] + "<br />")
    }
</script>

<p></p>
<p></p>

<script type="text/javascript">
    var i = 0
    for (i = 0; i <= 22; i++) {
        if (i == 3) {
            continue
        }
        document.write("数字是 " + i)
        document.write("<br />")
    }
</script>

<p>解释：当 i=3 时，会中断循环，并从下一个值开始继续循环。</p>


<p></p>
<p></p>


<script type="text/javascript">
    var i = 0
    for (i = 0; i <= 10; i++) {
        if (i == 3) {
            break
        }
        document.write("数字是xxxx " + i)
        document.write("<br />")
    }
</script>
<h1>解释：循环会在 i=3 时中断。</h1>
<%--<p>解释：循环会在 i=3 时中断。</p>--%>
<p></p>
<p></p>


<script type="text/javascript">
    i = 0
    do {
        document.write("数字是 " + i)
        document.write("<br />")
        i++
    }
    while (i <= 5)
</script>

<h1>解释：</h1>

<p><b>i</b> 等于 0。</p>

<p>循环首先会运行。</p>

<p>每循环一次，<b>i</b> 就会累加 1。</p>

<p>当 <b>i</b> 小于或等于 5 时，循环会继续运行。</p>

<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>


<script type="text/javascript">
    i = 0
    while (i <= 5) {
        document.write("数字是 " + i)
        document.write("<br />")
        i++
    }
</script>

<h1>解释：</h1>

<p><b>i</b> 等于 0。</p>

<p>当 <b>i</b> 小于或等于 5 时，循环将继续运行。</p>

<p>循环每运行一次，<b>i</b> 会累加 1。</p>


<script type="text/javascript">
    for (i = 1; i <= 6; i++) {
        document.write("<h" + i + ">这是标题 " + i)
        document.write("</h" + i + ">")
    }
</script>


<script type="text/javascript">
    for (i = 0; i <= 5; i++) {
        document.write("数字是 " + i)
        document.write("<br />")
    }
</script>

<h1>解释：</h1>

<p>for 循环的步进值从 i=0 开始。</p>

<p>只要 <b>i</b> 小于等于 5，循环就会继续运行。</p>

<p>循环每循环一次，<b>i</b> 就会累加 1。</p>


<script type="text/javascript">
    document.write("该消息在页面加载时输出。")
</script>


<h1>My Web Page</h1>

<p id="demo">A Paragraph</p>

<button type="button" onclick="myFunction()">Try it</button>


<script type="text/javascript">
    document.write("<h1>这是标题</h1>");
    document.write("<p>这是段落。</p>");
    document.write("<p>这是另一个段落。</p>");
</script>


<script type="text/javascript">
    /*
    下面的代码将输出
    一个标题和两个段落
    */
    document.write("<h1>这是标题</h1>");
    document.write("<p>这是段落。</p>");
    document.write("<p>这是另一个段落。</p>");
</script>

<script type="text/javascript">
    document.write("<h1>这是标题</h1>");
    document.write("<p>这是段落。</p>");
    //document.write("<p>这是另一个段落。</p>");
</script>


<script type="text/javascript">
    var firstname;
    firstname = "George";
    document.write(firstname);
    document.write("<br />");
    firstname = "John";
    document.write(firstname);
</script>

<p>上面的脚本声明了一个变量，为其赋值，显示该值，改变该值，然后再显示该值。</p>


<input type="button" onclick="disp_alert()" value="显示警告框"/>
<p></p>
<p></p>
<input type="button" onclick="disp_alert_enter()" value="显示警告框"/>
<p></p>
<p></p>

<input type="button" onclick="show_confirm()" value="Show a confirm box"/>

<p></p>
<p></p>

<input type="button" onclick="disp_prompt()" value="显示提示框"/>
<p></p>
<p></p>

<form>
    <input type="button" onclick="myfunction()" value="调用函数">
</form>
<p></p>
<p></p>

<form>
    <input type="button" onclick="myfunction('您好！啊，哈哈！！！')" value="调用函数">
</form>
<p>通过点击这个按钮，可以调用一个带参数的函数。该函数会输出这个参数。</p>
<p></p>
<p></p>


<script type="text/javascript">
    document.write(myFunction2())
</script>

<p>body 部分中的脚本调用一个函数。</p>

<p>该函数返回一段文本。</p>

<script type="text/javascript">
    document.write(product(6, 5))
</script>

<p>body 部分中的脚本调用一个带有两个参数（6 和 5）的函数。</p>
<p>该函数会返回这两个参数的乘积。</p>


</body>
</html>
