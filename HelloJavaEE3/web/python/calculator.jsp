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
<script>
    function ClearTextArea() {
        document.getElementById("idexpress").value = "";
        document.getElementById("idresult").value = "";
    }
    function LoadTextArea(str) {
        document.getElementById("idexpress").value = str;
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
<%
    String keyname = "express";
    String express = JspAdapter.getParaResult(request, keyname);
    String result = JspAdapter.getPythoncalcResult(express);
%>


<form name="form3" method="post" action="calculator.jsp" class="form2">
    <input type="button" name="showtext" value="自定义计算器" class="calcbtn"/><br/>
    <input type="text" id="idexpress" name=<%=keyname%> value="<%=express%>"  placeholder="输入表达式" class="text4"/><br/>
    <input type="text" id="idresult" name="result" value="<%=result%>" placeholder="这是结果"  class="text4"/><br/>
    <input type="button" id="id_cleararea" name="cleararea" value="清  空" class="calcbtn"
           onclick="ClearTextArea()">
    <input type="submit" name="calc" value="计  算" class="calcbtn"/><br/>
</form>

</body>
</html>
