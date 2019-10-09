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
<%@page import="java.sql.*" %>
<%@ page import="weilaidb.sql.SqlProc" %>  <%--导入java.sql包--%>


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
        height: 30px
    }

    .text2 {
        height: 30px;
        /*width: 80px;*/
    }

    .submitbtn {
        height: 30px;
        width: 10px;
    }


</style>

<%--================获取路径和基础路径=========================--%>
<%
    String path = request.getContextPath();
    String CurrentPath = request.getServletPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
    String currentAllPath = basePath + CurrentPath;
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
<a href="<%=basePath%>/index.jsp">首页</a>
<script>
    function openinsertdatapage() {
        window.open('<%=basePath%>/sql/insertdb.jsp')
    }
</script>


<form name="form1" method="post" action="<%=basePath%>/sql/bselectdb.jsp">
    <h3>
        请输入查询数据：<input type="text" class="text1" name="qrydata" size="80"/>
        <input type="submit" class="text1" name="Submit" value="点击查询"/>
        <input type="button" class="text1" name="insertdata" value="插入数据"
               onclick="openinsertdatapage();">
    </h3>
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
    } catch (Exception e) {
        out.print("\n");
    }

    try {
        String dbname = "alldb";
        conn = SqlProc.opendb(dbname);
        if (conn != null) {
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
            sql = "SELECT * from " + tablename + " order by id desc limit 10;";  //查询语句
        } else {
            String sqlhead = " SELECT * FROM " + tablename + " WHERE ";
            String sqltail = " order by id desc;";
            String sqlmid = " ";
            String[] qrylst = qryval
                    .replace("\"", "\\\"")
                    .split(" ");
            for (int lp = 0; lp < qrylst.length; lp++) {
                sqlmid += "content like  \"%" + new String(qrylst[lp].getBytes("iso-8859-1"), "utf-8") + "%\" ";
                if (lp != qrylst.length - 1)
                    sqlmid += " and ";

            }

            sql = sqlhead + sqlmid + sqltail;

        }

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
            <form target="_blank" name="form2" method="post" action="<%=basePath%>/sql/queryidwithmodify.jsp">
                <input type="text"
                       size="4"
                       class="text2"
                       name="iddata"
                       value="<%=orgshowid%>"/>
                <input type="submit" name="Submit" value="..." class="submitbtn"/>
            </form>
        </td>

        <%
            String showcontent = rs.getString("content")
                    .replaceAll("<", "")
                    .replaceAll(">", "")
                    .replace("\n", "<br/>");

            int showlen = 50;
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
            out.print("请输入查询数据!!!");
        } finally {
            if (null != conn) {
                conn.close();
            }
        }
    %>
</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

<style type="text/css">
    .btns {
        font-weight: bold;
        display: inline-block;
        width: 80px;
        height: 80px;
        border: #5fb878;
        background: #5fb878;
        font-size: 1.4em;
        text-align: center;
        padding-top: 5px;
        color: white;
    }

    a:hover {
        color: #FFFFFF
    }
</style>


<div style="overflow: hidden;position: fixed;right: 1px;bottom: 2px;z-index: 10;">
    <div style="overflow: hidden;">
        <div style="padding-top:20px;padding-right:10px;padding-bottom:3px">
            <a href="<%=currentAllPath%>#" style="float: right;" class="btns">顶部</a>
        </div>
    </div>
</div>


</body>
</html>

