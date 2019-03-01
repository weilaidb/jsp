<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/26
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/mysql/event.js">
    </script>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title >我的超级记事本(mysql)</title>
    <style>
        th, tr, td, table {
            border: 1px solid red;
            tab-interval: 10px;
            background-color: aliceblue;
            font-size: medium;
        }
    </style>


    <%--var a=<%int i=1;i++;out.print(i); %>;--%>
    <%--alert("a="+a);--%>
    <script type="text/javascript">
        //获取button按钮
        var btn=document.getElementById('btn');
        //获取p
        var content=document.getElementById('content');
        //获取p中的内容
        var str=content.innerHTML;
        //定义一个变量，表示当前的状态（收缩、展开）
        var onOff=true;// true表示展开
        console.log("onOff:" + onOff)
        btn.onclick=function(){
            console.log("onclick onOff:" + onOff)
            if(onOff) {
                content.innerHTML = str.substr(0,50)+"......";
                btn.innerHTML='>>>展开'
            } else {
                //说明当前状态是收缩的，需要展开
                content.innerHTML = str
                btn.innerHTML = '<<<收缩';
            }
            onOff=!onOff; //每点击一次，改变一次展开、收缩状态
            return false;  //阻止a标签的默认事件
        }

        window.onload=function(){
            console.log("onclick onOff:" + onOff)
            if(onOff) {
                content.innerHTML = str.substr(0,50)+"......";
                btn.innerHTML='>>>展开'
            } else {
                //说明当前状态是收缩的，需要展开
                content.innerHTML = str
                btn.innerHTML = '<<<收缩';
            }
            onOff=!onOff; //每点击一次，改变一次展开、收缩状态
            return false;  //阻止a标签的默认事件
        }
    </script>
</head>
<body>
<%--<h1>查询结果</h1>--%>
</p>
</p>

<style type="text/css">
    .text1{
    height:40px
    }
</style>

<form name="form1" method="post" action="sql/bselectdb.jsp">
    <h1>
    请输入查询数据：<input type="text" class="text1" name="qrydata" size="80">
        <input type="submit" name="Submit" value="点击查询">
    </h1>
</form>


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
    }catch (Exception e)
    {
    }


try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=true"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=false"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

        if(conn != null){
//            out.print("数据库连接成功！");
            out.print("<br />");
%>

<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <%--<th>名称</th>--%>
        <th>内容</th>
    </tr>
    <%
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = "abc";
        if(qryval.trim().isEmpty())
        {
            sql = "SELECT * from " + tablename + " order by id desc limit 30;";  //查询语句
        }
        else
        {
            String sqlhead = " SELECT * FROM "+ tablename  + " WHERE ";
            String sqltail = " order by id desc;";
            String sqlmid = " ";
            String []qrylst = qryval.split(" ");
            for (int lp = 0; lp < qrylst.length; lp++) {
//                out.println("split str:" + new String(qrylst[lp].getBytes("iso-8859-1"),"utf-8"));
//                out.print("<br />");
                sqlmid += "content like  \"%" + new String(qrylst[lp].getBytes("iso-8859-1"),"utf-8") + "%\" ";
                if(lp != qrylst.length - 1)
                    sqlmid += " and ";

            }

            sql = sqlhead + sqlmid + sqltail;
            out.println("sql express:" + sql);
            out.print("<br />");


        }
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
    %>
    <tr>
        <td ><%=rs.getString("id").replace("\n", "<br/>") %></td>
        <%--<td ><%=rs.getString("name").replace("\n", "<br/>") %></td>--%>
        <td ><%=rs.getString("content").replace("\n", "<br/>") %></td>
    </tr>


    <%

                }
                out.print("查询结果：" + rowCount + " 条");
                out.print("<br/>");
            }else{
                out.print("连接失败！");
            }
        }catch (Exception e) {
//            e.printStackTrace();
//            out.print("数据库连接异常！");
            out.print("请输入查询数据！");
        }
    %>
</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font> </h2>




</body>
</html>

