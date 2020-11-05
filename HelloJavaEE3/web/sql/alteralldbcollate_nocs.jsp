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
        height: 80px;
        /*width: 80px;*/
    }

    .submitbtn {
        height: 80px;
        width: 100px;
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
    <%--================javascript定义=========================--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/mysql/event.js">
        //获取button按钮
        var btn = document.getElementById('showorhidebtn');
        //获取p
        var content = document.getElementById('tablecontent');
        //获取p中的内容
        var str = content.innerHTML;
        //定义一个变量，表示当前的状态（收缩、展开）
        var onOff = true;// true表示展开
        console.log("onOff:" + onOff)
        btn.onclick = function () {
            console.log("onclick onOff:" + onOff)
            if (onOff) {
                content.innerHTML = str.substr(0, 50) + "......";
                btn.innerHTML = '>>>展开'
            } else {
                //说明当前状态是收缩的，需要展开
                content.innerHTML = str
                btn.innerHTML = '<<<收缩';
            }
            onOff = !onOff; //每点击一次，改变一次展开、收缩状态
            return false;  //阻止a标签的默认事件
        }

        window.onload = function () {
            console.log("onclick onOff:" + onOff)
            if (onOff) {
                content.innerHTML = str.substr(0, 50) + "......";
                btn.innerHTML = '>>>展开'
            } else {
                //说明当前状态是收缩的，需要展开
                content.innerHTML = str
                btn.innerHTML = '<<<收缩';
            }
            onOff = !onOff; //每点击一次，改变一次展开、收缩状态
            return false;  //阻止a标签的默认事件
        }

        function setqryid(id) {
            console.log("id is:" + id);
            request.setParameter("iddata", id);
        }
    </script>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的超级记事本(mysql)</title>
</head>
<body>
<%--<h1>查询结果</h1>--%>
</p>
</p>


<%--<form name="form1" method="post" action="sql/bselectdb.jsp">--%>
<%--<h1>--%>
<%--请输入查询数据：<input type="text" class="text1" name="qrydata" size="80"/>--%>
<%--<input type="submit" name="Submit" value="点击查询"/>--%>
<%--</h1>--%>
<%--</form>--%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
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
        Class.forName("org.sqlite.JDBC");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
        conn = DriverManager.getConnection(url);  //连接状态
        stmt = null;
        rs = null;

        if (conn != null) {
//            out.print("数据库连接成功！");
            out.print("<br />");
            boolean bflag = false;
            String sql = "";  //查询语句
            stmt = conn.createStatement();
            sql = "ALTER TABLE abc MODIFY COLUMN content TEXT;";
            out.println("sql express:" + sql);
            out.print("<br />");
            bflag = stmt.execute(sql);

            sql = "ALTER TABLE abc MODIFY content text CHARACTER SET utf8 COLLATE 'utf8_bin';";
            out.println("sql express:" + sql);
            out.print("<br />");
            stmt = conn.createStatement();
            bflag = stmt.execute(sql);


            out.print("设置成功");
            stmt.close();
        } else {

        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("设置失败！");
        out.print("<br />");
        out.println("exception:" + e.getLocalizedMessage());
    } finally {
        conn.close();
    }
%>


<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>


</body>
</html>

