<%@ page import="python.PythonCommand" %>
<%@ page import="weilaidb.sql.JspAdapter" %>
<%@ page import="org.python.antlr.ast.Str" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/18
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/basepath.jsp"%>
<%--<link href="../css/explorer.css" rel="stylesheet" type="text/css">--%>

<html>



<%--================javascript定义=========================--%>
<script language="JavaScript">
    function ClearTextArea() {
        document.getElementById("idcontent").value = "";
        document.getElementById("idresult").value = "";
    }
    function LoadTextArea(str) {
        document.getElementById("idcontent").value = str;
    }
    function HexTextArea() {
        var idcontenttext = document.getElementById("idcontent").value;
        // document.getElementById("demo").innerHTML=n;
        // alert(document.getElementById("idcontent").innerHTML)
        // alert(document.getElementById("idcontent").value)
        // document.getElementById("demo").innerHTML="nihaoma";
// 定义和用法
//     indexOf() 方法可返回某个指定的字符串值在字符串中首次出现的位置。
//
// 语法
//     stringObject.indexOf(searchvalue,fromindex)
//     参数	描述
//     searchvalue	必需。规定需检索的字符串值。
// fromindex	可选的整数参数。规定在字符串中开始检索的位置。它的合法取值是 0 到 stringObject.length - 1。如省略该参数，则将从字符串的首字符开始检索。
// 说明
//     该方法将从头到尾地检索字符串 stringObject，看它是否含有子串 searchvalue。开始检索的位置在字符串的 fromindex 处或字符串的开头（没有指定 fromindex 时）。如果找到一个 searchvalue，则返回 searchvalue 的第一次出现的位置。stringObject 中的字符位置是从 0 开始的。
//
// 提示和注释
//     注释：indexOf() 方法对大小写敏感！
//
// 注释：如果要检索的字符串值没有出现，则该方法返回 -1。
        if(-1 == idcontenttext.indexOf("hex"))
        {
            document.getElementById("idcontent").value = "hex(" + document.getElementById("idcontent").value + ")";
        }
    }

</script>

<head>
    <title><%=JspAdapter.getJspTitleByKey("calc")%></title>
    <style type="text/css">
        .form2{
            margin: 5px;

        }

        .text4 {
            height: 60px;
            width: 90%;
            alignment: center;
            alignment-baseline: center;
            border: black;
            border-color: red;
        }
        .calcbtn {
            height: 55px;
            width: 10%;
            text-align: center;
            font-family: "Courier New";
            font-size: large;
            padding-right: 10px;
            padding-left: 10px;
            margin-right: 40px;
            /*border-width: medium;*/
            /*font-style: oblique;*/
            /*border-width: thin;*/
            /*border-color: darkviolet;*/
            /*background-color: silver;*/
        }

        p
        {
            word-spacing:30px;
        }
    </style>
</head>
<body>

<p id="demo">Visit Microsoft!Visit Microsoft!</p>

<%
    String keyname = "express";
    String express = JspAdapter.getParaResult(request, keyname);
    String result = JspAdapter.getPythoncalcResult(express);
%>


<form name="form3" method="post" action="calculator.jsp" class="form2">
    <input type="button" name="showtext" value="自定义计算器" class="calcbtn"/>
    <input type="button" name="hextext" value="HEX" class="calcbtn"
        onclick="HexTextArea()"/>
    <br/>
    <input type="text" id="idcontent" name=<%=keyname%> value="<%=express%>"  placeholder="输入表达式" class="text4"/><br/>
    <input type="text" id="idresult" name="result" value="<%=result%>" placeholder="这是结果"  class="text4"/><br/>
    <input type="button" id="id_cleararea" name="cleararea" value="清  空" class="calcbtn"
           onclick="ClearTextArea()">
    <input type="submit" name="calc" value="计  算" class="calcbtn"/><br/>
</form>

</body>
</html>
