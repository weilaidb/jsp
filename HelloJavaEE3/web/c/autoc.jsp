<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/17
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%--================page定义=========================--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<%--================css配置=========================--%>
<style type="text/css">
    .mytable th, tr, td, table {
        /* for IE */
        text-overflow: ellipsis;
        /* for Firefox,mozilla */
        -moz-text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        text-align: left;

        border: 1px solid red;
        tab-interval: 10px;
        background-color: aliceblue;
        font-size: medium;
    }

    .leftshow {
        height: 500px;
        width: 1000px;
        font-size: 34px;
    }

    .text2 {
        height: 20px;
    }

    .convertbtn {
        height: 150px;
        width: 500px;
    }
</style>


<html>
<head>
    <title>Auto C Code</title>
</head>
<body>
<h1>生成C代码</h1>


<form name="form1" method="post" action="/c/autoc2.jsp">
    <h1>
    <textarea class="leftshow" name="textarealeft"></textarea>
        <p/>
        <input type="submit" class="convertbtn"  name="Submit" value="转换"/>
    </h1>
</form>




</body>
</html>
