<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/2
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%--================page定义=========================--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<%--================引入头文件=========================--%>
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>

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

    .text1 {
        height: 40px
    }

    .text2 {
        height: 20px;
    }

    .boxes {
        font-size: 20px;
    }
</style>

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


<html>
<head>
    <title>显示ID数据</title>
</head>
<body>

<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    String qryiddata = "";
    try {
        qryiddata = request.getParameter("iddata");
//    out.print("查询数据项:" + qryiddata);
    } catch (Exception e) {

    }

    Connection connection = null;
    try {
        Class.forName("org.sqlite.JDBC");
//        数据库地址写不正常，会报错。
        String dbpath = "jdbc:sqlite:D:/Dropbox/weidb/all.db";
        connection = DriverManager.getConnection(dbpath);

        Statement statement = connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口
        int whichid = Integer.valueOf(qryiddata).intValue();

        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = "c_table";
        sql = "SELECT * from " + tablename + " WHERE id=" + whichid + ";";  //查询语句

//        out.println("sql express:" + sql);
//        out.print("<br />");

        ResultSet rSet = statement.executeQuery(sql);//搜索数据库，将搜索的放入数据集ResultSet中

%>


<%

    int rowCount = 0;

    while (rSet.next()) {            //遍历这个数据集
        rowCount++;
%>




<h1><%=qryiddata%>
</h1>


<table border="1" width="100%" class='mytable'>
    <tr>
        <%--<th>序列</th>--%>
        <%--<th>名称</th>--%>
        <th>数据</th>
    </tr>

    <%String toshowcontent = rSet.getString(2);%>

    <button id="btncopy">复制</button>
    <button id="btnpaste">粘贴</button>
    <tr>
        <td>
            <div contenteditable="true">
                <%--<input type="text" id="ipt" placeholder="输入要复制的东西"/> <br/><br/>--%>
                <textarea class="boxes"
                <%--rows="700"--%>
                          rows="80"
                          id="ipt"
                          placeholder="输入要复制的东西"
                          style="width: 100%;"><%=toshowcontent%></textarea>
            </div>
        </td>
    </tr>
    <%--<div>--%>
    <%--<input type="text" id="ipt" placeholder="输入要复制的东西"/> <br/><br/>--%>
    <%--<button id="btncopy">复制</button>--%>
    <%--</div>--%>


    <%
            }
            rSet.close();//关闭数据集
            connection.close();//关闭数据库连接
            out.print("查询结果：" + rowCount + " 条["
                    + new String(qryiddata.getBytes("iso-8859-1"), "utf-8")
                    + "]");
            out.print("<br/>");
        } catch (Exception e) {
            out.println("Opened database failed");
            out.print("<br />");
            out.println(e.getClass().getName() + ": " + e.getMessage());
            out.print("<br />");
        }
    %>
</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

<style type="text/css">
    html, body {
        margin: 0;
    }

    div {
        padding: 20px;
        padding-right: 20px;
    }

    input {
        /*width: 240px;*/
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

<%--换成user.js更加不好使了--%>
<script src="../js/mysql/userext.js">
</script>
</body>
</html>
