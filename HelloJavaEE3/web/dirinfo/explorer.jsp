<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
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
<%@include file="../common/basepath.jsp"%>
<%
    //    打开的文件列表
//    增加表项openlist，用以打开文件路径
    SqlInterface inter = new SqlInterface();
    String dbName = "showui";
%>
<%
//    表名使用模块名
    String tableName = app_CurrentPath.toLowerCase().substring(1)
            .replaceAll("\\/.*", "");
    System.out.println("tablename:" + tableName);
%>

<%

    List<String> openlist = inter.getAllDesc(dbName, tableName, "");
//    for (String file :
//            openlist) {
//        System.out.println(file);
//    }

%>



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
        height: 1px;
        width: 0px;
        border: black;
        border-color: black;
    }

    .submitbtn {
        height: 50px;
        width: 70%;
        text-align: left;
        font-family: "Courier New";
        font-size: xx-large;
        border-width: thin;
        /*border-color: darkviolet;*/
        /*background-color: silver;*/
    }

    .dia_wbkbig {
        width: 100%;
        height: 80%;
        alignment: center;
        align-content: center;
    }

    .body{
        background-color: black;
    }
</style>


<html>
<head>
    <title>时钟时间</title>
</head>

<%
    request.setCharacterEncoding("UTF-8");//传值编码
    response.setContentType("text/html;charset=UTF-8");//设置传输编码
%>

<body>
<%
    //定时刷新页面
//    response.setHeader("Refresh","30;explorer.jsp");
%>

<h1><a href="<%=app_basePath%>/index.jsp">首页</a>
    <%--<a href="add.jsp">添加</a>--%>
    <a href="delete.jsp" target="_blank">删除</a>
    <a href="insert.jsp" target="_blank">写入</a>
</h1>
<%--<h1>时钟时间</h1>--%>
<%!
    //方法四：
    public final static boolean isNumeric(String s) {
        if (s != null && !"".equals(s.trim()))
            return s.matches("^[0-9]*$");
        else
            return false;
    }
%>
<%
    String path = request.getParameter("openpath");
    if (path != null && path.trim() != "") {
        try {
            System.out.println("defaultCharset " + Charset.defaultCharset());
            System.out.println("open path     is " + path);

//            ClientSendMsg2QtServer.sendStr2QtServer(path);
            out.write(path);
        } catch (Exception e) {
            e.printStackTrace();
            out.write(e.getMessage());
        }
    }

    for (String file :
            openlist) {
        String[] splitlst = file.split("\\s+", 2);
        if(splitlst.length < 2)
        {
            continue;
        }
        /**
         * 第一个不为索引的不处理
         */
        if(false == isNumeric(splitlst[0].trim()))
        {
            continue;
        }
%>

<%=splitlst[1].trim()%>
<%--    <form name="form2" method="post"  target="frame_right" action="<%=app_basePath%>/sql/queryidwithmodify.jsp">--%>
<%--        <input type="text"--%>
<%--               size="4"--%>
<%--               class="text2"--%>
<%--               name="iddata"--%>
<%--        &lt;%&ndash;readonly="readonly"&ndash;%&gt;--%>
<%--               value="<%=splitlst[0].trim()%>"/>--%>
<%--        <input type="submit" name="submit" value="<%=splitlst[1].trim()%>" class="submitbtn"/>--%>
<%--    </form>--%>
</h3>

<%
    }
%>

</body>
</html>
