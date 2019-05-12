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
        display: block;
        margin: 0 auto;
        overflow: hidden;
        width: 550px;
        height: 100%;
        line-height: 24px;
        padding: 2px;

        min-height: 20px;
        max-height: 1000px;
        font-size: 16px;
        outline: 0;
        border: 1px solid #a0b3d6;
        line-height: 24px;
        word-wrap: break-word;
        overflow-x: hidden;
        overflow-y: auto;
        border-color: rgba(82, 168, 236, 0.8);
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
        background-color: #c8eccc;
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
//        if (!qryiddata.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryiddata.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
    } catch (Exception e) {
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=true"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=false"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

        if (conn != null) {
//            out.print("数据库连接成功！");
//            out.print("<br />");
%>

<h1><%=qryiddata%>
</h1>


<table border="1" width="100%" class='mytable'>
    <tr>
        <%--<th>序列</th>--%>
        <%--<th>名称</th>--%>
        <th>数据</th>
    </tr>
    <%
        int whichid = Integer.valueOf(qryiddata).intValue();
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = "abc";
        sql = "SELECT * from " + tablename + " WHERE id=" + whichid + ";";  //查询语句

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
    %>

    <%String toshowcontent = rs.getString("content");%>

    <button id="btncopy">复制</button>
    <button id="btnpaste">粘贴</button>
    <tr>
        <td>
            <form name="form1" method="post" action="">
                <input type="submit" name="Submit" value="修改" class="submitbtn"/>
            <%--<input type="text" id="ipt" placeholder="输入要复制的东西"/> <br/><br/>--%>
            <textarea class="boxes"
                      rows="1000"
            <%--autoHeight="true"--%>
            <%--rows="80"--%>
                      id="ipt"
                      name="modifythings"
                      placeholder="输入要复制的东西"
                      style="width: 100%;"><%=toshowcontent%></textarea>
            </form>
        </td>
    </tr>
    <%--<div>--%>
    <%--<input type="text" id="ipt" placeholder="输入要复制的东西"/> <br/><br/>--%>
    <%--<button id="btncopy">复制</button>--%>
    <%--</div>--%>


    <%
                }
                out.print("查询结果：" + rowCount + " 条[" + qryiddata + "]");
                out.print("<br/>");
            } else {
                out.print("连接失败！");
            }
        } catch (Exception e) {
            out.print("请输入查询数据!!!");
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


<%--<input id=edit value=范例><br>--%>
<%--<button onclick=fn_doufucopy()>Copy</button>--%>
<%--<button onclick=fn_doufupaste()>paste</button><br>--%>
<%--<textarea id=tt rows=10 cols=50></textarea>--%>

<%--<script type="text/javascript">--%>
<%--function fn_doufucopy() {--%>
<%--edit.select();--%>
<%--document.execCommand('Copy');--%>
<%--}--%>
<%--/*--%>
<%--*该function执行paste指令--%>
<%--*/--%>
<%--function fn_doufupaste() {--%>

<%--setTimeout(function(){--%>
<%--tt.focus();--%>
<%--document.execCommand('paste');--%>
<%--},500);--%>

<%--}--%>

<%--</script>--%>
</body>
</html>