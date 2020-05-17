<%@ page import="com.cmd.EncodingUtil" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="com.commmon.SqlInterface" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/19
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@include file="../../../common/basepath.jsp"%>
<%
    //    打开的文件列表
//    增加表项openlist，用以打开文件路径
    SqlInterface inter = new SqlInterface();
    String dbName = SqlProc.getDbnameShowUi();
%>

<%
    //    表名使用模块名
    String tableName = app_CurrentPath.toLowerCase().replace("/modules", "")
            .substring(1)
            .replaceAll("\\/.*", "");
    System.out.println("tablename:" + tableName);
%>

<%
    List<String> openlist = inter.getAll(dbName, tableName, "");
    //    for (String file :
    //            openlist) {
    //        System.out.println(file);
    //    }

%>
<html>
<head>
    <title>删除</title>
</head>
<%
    //定时刷新页面
//    response.setHeader("Refresh","5;delete.jsp");
%>
<%
    String basePath = application.getContextPath();
%>
<%
    request.setCharacterEncoding("UTF-8");//传值编码
    response.setContentType("text/html;charset=UTF-8");//设置传输编码
%>

<body>


<h1><a href="<%=basePath%>/index.jsp">首页</a>
    <a href="explorer.jsp" target="_blank">文件列表</a>
</h1>
<h1>请选择删除文件</h1>

<%
    String path = request.getParameter("deletefile");
    String result = "数据为空";
    if (path != null && path.trim() != "") {
        try {
            result = inter.deleteName(dbName, tableName, path);
%>
        <jsp:forward page="delete.jsp"/>
<%
        } catch (Exception e) {
            e.printStackTrace();
//            out.write(e.getMessage());
        }

    }
%>
<%--<%=result%>--%>
<%
    for (String file :
            openlist) {

%>
<h3><a href="delete.jsp?deletefile=<%=EncodingUtil.encodeURIComponent(file)%>"><%=file%>
</a><br></h3>
<%
    }
%>

</body>
</html>
