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
<%@page import="java.sql.*" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="com.commmon.SqlInterface" %>  <%--导入java.sql包--%>
<%@include file="../common/basepath.jsp"%>
<%--================css配置=========================--%>
<link rel="stylesheet" type="text/css" href="../css/base.css" />


<script language="JavaScript">
    function Refresh()
    {
        window.location.reload();
    }
    // setTimeout('Refresh()',1000); //1秒刷新一次
</script>

<html>
<head>
    <title>显示ID数据</title>
</head>
<body>
<a href="<%=app_basePath%>/index.jsp"  target="_blank">首页</a>

<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    Connection conn = null;
    String dbname = "alldb";
    Statement stmt = null;
    ResultSet rs = null;
    String sql = "";  //查询语句
    String tablename = "abc";
    String qryiddata = "";
    try {
        qryiddata = request.getParameter("iddata");
    } catch (Exception e) {
    }

    if(null == qryiddata)
    {
        qryiddata = "";
    }

    try {
        conn = SqlProc.opendb(dbname);
        if (conn != null) {
%>
<form name="form1" method="post" action="modifyid.jsp">
<table border="1" width="100%" height="100%" class='mytable'>
    <%
        int whichid = 0;
        if(qryiddata.isEmpty())
        {
            SqlInterface inter = new SqlInterface();
            whichid = inter.getMaxId(dbname,tablename);
            qryiddata = Integer.toString(whichid);
        }
        else
        {
            whichid = Integer.valueOf(qryiddata).intValue();
        }

        sql = "SELECT * from " + tablename + " WHERE id=" + whichid + ";";  //查询语句

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
    %>

    <%String toshowcontent = rs.getString("content");%>
    <%
        int actualrows = toshowcontent.split("\n").length;
        int maxrows = 100;
        if(actualrows < maxrows)
        {
            actualrows = maxrows;
        }
    %>
    <tr>
                <td>

                <input type="submit" id="savetext" name="Submit" value="保存" class="submitbtn"/>
                        <input type="text" name="iddataext" value="<%=qryiddata%>">
                <textarea class="boxes"
                          <%--rows="100%"--%>
                          rows="<%=actualrows%>"
                          id="ipt"
                          name="modifythings"
                          placeholder="输入要复制的东西"
                          style="width: 100%;"><%=toshowcontent%>
                        </textarea>

                </td>
    </tr>
    <%
                }
            } else {
                out.print("连接失败！");
            }
        } catch (Exception e) {
            out.print("请输入查询数据!!!" + e.getMessage());
        }
    %>
</table>

    <div style="overflow: hidden;position: fixed;right: 0px;bottom: 0px;z-index: 1;">
        <div style="padding-top:1px;padding-right:1px;padding-bottom:1px">
            <input type="button" id="btn_refresh" onclick="Refresh()" value="刷新" class="btns"/>
            <input type="submit" id="savetext" name="Submit" value="保存" class="btns"/>
            <a href="javascript:void(0);" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;" class="btns">页顶</a>
            <a href="javascript:void(0);" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight; "搜索 class="btns">页底</a>
        </div>
    </div>

</form>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>


</body>
</html>
