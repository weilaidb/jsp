<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/26
  Time: 21:12
  To change this template use File | Settings | File Templates.
  File:bselectdb.jsp
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
        height: 40px;
        /*width: 80px;*/
    }
    .submitbtn {
        height: 40px;
        width: 80px;
    }
</style>

<%--================获取路径和基础路径=========================--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的超级记事本(mysql)</title>
</head>
<body>
<script>
    function openinsertdatapage() {
        window.open('<%=basePath%>sql/insertdb.jsp')
    }
</script>
<%
    String basePathext = request.getContextPath();
%>
<form name="form1" method="post" action="<%=basePathext%>/SelectDatabase">
    <%--<form name="form1" method="post" action="sql/bselectdb.jsp">--%>
    <h1>
        请输入查询数据：<input type="text" class="text1" name="qrydata" size="80"/>
        <input type="submit" name="Submit" value="点击查询"/>
        <input type="button" name="insertdata" value="插入数据"
               onclick="openinsertdatapage();">
        <%--onclick="javascript:window.location='<%=basePath%>sql/insertdb.jsp' "/>--%>
        <a href="/url" target="_blank"></a>
    </h1>
</form>

<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
%>
<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    String qryval = "";
    try {
        qryval = request.getParameter("qrydata");
//    out.print("查询数据项:" + qryval);
//        if (!qryval.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryval.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
    } catch (Exception e) {
        out.print("\n");
    }

    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        conn = DriverManager.getConnection(url, username, password);  //连接状态
        if (conn != null) {
//            out.print("数据库连接成功！");
            out.print("<br />");
%>

<table border="1" width="100%" class='mytable'>
    <tr>
        <th>序列</th>
        <th>数据</th>
    </tr>
    <%
        stmt = null;
        rs = null;
        String sql = "";  //查询语句
        String tablename = "abc";
        if (qryval.trim().isEmpty()) {
            sql = "SELECT * from " + tablename + " order by id desc limit 50;";  //查询语句
        } else {
            String sqlhead = " SELECT * FROM " + tablename + " WHERE ";
            String sqltail = " order by id desc;";
            String sqlmid = " ";
            String[] qrylst = qryval.replace("\"", "\\\"").split(" ");
            for (int lp = 0; lp < qrylst.length; lp++) {
                sqlmid += "content like  \"%" + new String(qrylst[lp].getBytes("iso-8859-1"), "utf-8") + "%\" ";
                if (lp != qrylst.length - 1)
                    sqlmid += " and ";

            }

            sql = sqlhead + sqlmid + sqltail;

        }
        out.println("sql express:" + sql);
        out.print("<br />");

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
    %>


    <tr>
        <td>
            <%
                String orgshowid = rs.getString("id").replace("\n", "<br/>");
            %>
            <form name="form2" method="post" action="sql/queryid.jsp">
                <input type="text"
                       size="4"
                       class="text2"
                       name="iddata"
                <%--readonly="readonly"--%>
                       value="<%=orgshowid%>"/>
                <input type="submit" name="Submit" value="More" class="submitbtn"/>
            </form>
        </td>

        <%
            String showcontent = rs.getString("content")
                    .replaceAll("<", "")
                    .replaceAll(">", "")
                    .replace("\n", "<br/>");

            int showlen = 500;
            long totallen = showcontent.length();
            if (showcontent.length() > showlen) {
                showcontent = showcontent.substring(0, showlen);
            }
            long curlen = showcontent.length();
            if (totallen == 0) {
                totallen = 100;
            }
            String appendstr = "ShowRate:" + (curlen * 100 / totallen) + "%";
            if (totallen == 0 || ((curlen * 100 / totallen) == 100)) {
                appendstr = "";
            } else {
                appendstr = appendstr;
            }
        %>
        <td><%=showcontent + "<br/><br/><br/>" + appendstr%>
        </td>

    </tr>

    <%
                }
                out.print("查询结果：" + rowCount + " 条["
                        + new String(qryval.getBytes("iso-8859-1"), "utf-8")
                        + "]");
                out.print("<br/>");
                rs.close();
                stmt.close();

            } else {
                out.print("连接失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
//            out.print("数据库连接异常！");
            out.print("请输入查询数据!!!");
        } finally {
//            rs.close();
//            stmt.close();
            conn.close();
        }
    %>
</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>


</body>
</html>

