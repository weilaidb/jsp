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



<%--================打开数据库================--%>
<%
    String qryval = "";
    try {
        qryval = request.getParameter("textarealeft");
        if (!qryval.isEmpty()) {
            out.print("查询内容:" +
                    new String(qryval.getBytes("iso-8859-1"), "utf-8"));
            out.print("<br />");
        }
    } catch (Exception e) {
        out.print("\n");
    }

    %>


</body>
</html>
