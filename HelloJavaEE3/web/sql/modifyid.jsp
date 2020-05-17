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
<%@ page import="com.timedate.DateTimePub" %>  <%--导入java.sql包--%>
<%--<%@ include file="../css/bdata.css"%>--%>
<link href="../css/bdata.css" rel="stylesheet" type="text/css"/>


<html>
<head>
    <%--<%--%>
    <%--//定时刷新页面--%>
    <%--response.setHeader("Refresh","3;queryidwithmodify.jsp");--%>
    <%--%>--%>
    <%--<meta http-equiv="refresh" content="1;url=queryidwithmodify.jsp">--%>
    <%--<script type="text/javascript">setTimeout("history.go(-1)", 3000);  </script>--%>
    <SCRIPT language=javascript>
        function go() {
            window.history.go(-1);
        }

        setTimeout("go()", 300);
    </SCRIPT>

    <title>显示ID数据</title>
</head>
<body>


<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    String qryiddata = "";
    try {
        qryiddata = (String) request.getParameter("iddataext");
        out.print("修改ID【" + qryiddata + "】的内容");
    } catch (Exception e) {
    }
%>

<%
    String modifydata = "";
    try {
        modifydata = request.getParameter("modifythings");
    } catch (Exception e) {
    }

%>

<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    String insertval = "";
    String sql = "";  //查询语句
    String tablename = "abc";
%>


<%
    try {
        String dbname = "alldb";
        conn = SqlProc.opendb(dbname);
        if (conn != null) {
        }
    } catch (Exception e) {
        out.println("数据库连接失败<br/>");
        return;
    }

%>

<%
    try {
        insertval = new String(modifydata.getBytes("iso-8859-1"), "utf-8");
        insertval = insertval.replace("\"", "\"\"");
        insertval = insertval.replace("\\", "\\\\");
        //此处时间暂时不添加
//        insertval = insertval + DateTimePub.getCurrentDateTimeOneLine();
        String nameval = insertval.substring(0, insertval.length() > 100 ? 100 : insertval.length())
                + System.currentTimeMillis();
        if (!insertval.isEmpty()) {
            sql = "UPDATE " + tablename + " SET " +
                    "`name` = "
                    + "\""
                    + nameval
                    + "\""
                    + ", `content` = "
                    + "\""
                    + insertval
                    + "\""
                    + "WHERE (`id` = "
                    + "\""
                    + qryiddata
                    + "\""
                    +
                    ")";  //执行语句
        } else {
            out.println("数据为空!!<br />");
            return;
        }

        stmt = conn.createStatement();
        stmt.execute(sql);
        rs.close();
        stmt.close();
        conn.close();
        out.println("修改成功!!<br />");
        return;

    } catch (Exception e) {
        if (insertval != null && !insertval.isEmpty()) {
            if (null == e.getMessage()) {
                out.println("修改成功!!<br />");
            } else {
                out.println("sql: " + sql);
                out.println("修改异常!! " + e.getMessage());
            }
        } else {
            out.println("数据为空!!<br />");
        }
    }
%>

</body>
</html>
