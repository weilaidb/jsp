<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/13
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Content-Language" content="zh-cn" />
</head>



<body bgcolor="#deb887">
<p>
    <a href="/index.html">本文本</a> 是一个指向本网站中的一个页面的链接。</p>

<p><a href="http://www.microsoft.com/">本文本</a> 是一个指向万维网上的页面的链接。</p>


<p>一打有 <del>二十</del> <ins>十二</ins> 件。</p>

<p>大多数浏览器会改写为删除文本和下划线文本。</p>

<p>一些老式的浏览器会把删除文本和下划线文本显示为普通文本。</p>



这是长的引用：
<blockquote>
    这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。
</blockquote>

这是短的引用：
<q>
    这是短的引用。
</q>

<p>
    使用 blockquote 元素的话，浏览器会插入换行和外边距，而 q 元素不会有任何特殊的呈现。
</p>




<p>
    如果您的浏览器支持 bi-directional override (bdo)，下一行会从右向左输出 (rtl)；
</p>

<bdo dir="rtl">
    Here is some Hebrew text
</bdo>





<abbr title="etcetera">etc.</abbr>
<br />
<acronym title="World Wide Web">WWW</acronym>

<p>在某些浏览器中，当您把鼠标移至缩略词语上时，title 可用于展示表达的完整版本。</p>

<p>仅对于 IE 5 中的 acronym 元素有效。</p>

<p>对于 Netscape 6.2 中的 abbr 和 acronym 元素都有效。</p>














<address>
    Written by <a href="mailto:webmaster@example.com">Donald Duck</a>.<br>
    Visit us at:<br>
    Example.com<br>
    Box 564, Disneyland<br>
    USA
</address>




<code>Computer code</code>
<br />
<kbd>Keyboard input</kbd>
<br />
<tt>Teletype text</tt>
<br />
<samp>Sample text</samp>
<br />
<var>Computer variable</var>
<br />

<p>
    <b>注释：</b>这些标签常用于显示计算机/编程代码。
</p>




<pre>
这是
预格式文本。
它保留了      空格
和换行。
</pre>

<p>pre 标签很适合显示计算机代码：</p>

<pre>
for i = 1 to 10
     print i
next i
</pre>





<b>This text is bold</b>

<br />

<strong>This text is strong</strong>

<br />

<big>This text is big</big>

<br />

<em>This text is emphasized</em>

<br />

<i>This text is italic</i>

<br />

<small>This text is small</small>

<br />

This text contains
<sub>subscript</sub>

<br />

This text contains
<sup>superscript</sup>


<img src="/i/eg_w3school.gif" width="300" height="120" />




<a href="http://www.w3school.com.cn">
    This is a link</a>





<p>这是段落。</p>
<p>这是段落。</p>
<p>这是段落。</p>

<p>段落元素由 p 标签定义。</p>



<h1>This is heading 1</h1>
<h2>This is heading 2</h2>
<h3>This is heading 3</h3>
<h4>This is heading 4</h4>
<h5>This is heading 5</h5>
<h6>This is heading 6</h6>

<p>请仅仅把标题标签用于标题文本。不要仅仅为了产生粗体文本而使用它们。请使用其它标签或 CSS 代替。</p>




<h2>请看: 改变了颜色的背景。</h2>




<!--这是一段注释。注释不会在浏览器中显示。-->

<p>这是一段普通的段落。</p>














<p>hr 标签定义水平线：</p>
<hr />
<p>这是段落。</p>
<hr />
<p>这是段落。</p>
<hr />
<p>这是段落。</p>







<h1 align="center">This is heading 1</h1>

<p>上面的标题在页面中进行了居中排列。上面的标题在页面中进行了居中排列。上面的标题在页面中进行了居中排列。</p>




<p>这是段落。</p>
<p>这是段落。</p>
<p>这是段落。</p>

<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>
<p>段落元素由 p 标签定义。</p>



<p>
    这个段落
    在源代码中
    包含许多行
    但是浏览器
    忽略了它们。
</p>

<p>
    这个段落
    在源代码       中
    包含   许多行
    但是      浏览器
    忽略了  它们。
</p>

<p>
    段落的行数依赖于浏览器窗口的大小。如果调节浏览器窗口的大小，将改变段落中的行数。
</p>



<h1>春晓</h1>

<p>
    春眠不觉晓，
    处处闻啼鸟。
    夜来风雨声，
    花落知多少。
</p>

<p>注意，浏览器忽略了源代码中的排版（省略了多余的空格和换行）。</p>






<p>
    To break<br />lines<br />in a<br />paragraph,<br />use the br tag.
</p>










<h1>This is heading 1</h1>
<h2>This is heading 2</h2>
<h3>This is heading 3</h3>
<h4>This is heading 4</h4>
<h5>This is heading 5</h5>
<h6>This is heading 6</h6>

<p>请仅仅把标题标签用于标题文本。不要仅仅为了产生粗体文本而使用它们。请使用其它标签或 CSS 代替。</p>



</body>
</html>

