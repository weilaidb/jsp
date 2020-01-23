<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
<%@ page import="com.commmon.SqlInterface" %>
<%@ page import="com.commmon.CharacterFilter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@include file="../common/basepath.jsp"%>

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
        height: 0px;
        width: 0px;
        border: black;
        border-color: black;
    }
    .form2{
        margin: 5px;

    }

    .submitbtn {
        height: 25px;
        width: 90%;
        text-align: left;
        font-family: "Courier New";
        font-size: small;
        /*font-style: oblique;*/
        /*border-width: thin;*/
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

<%
    //    打开的文件列表
//    增加表项openlist，用以打开文件路径
    SqlInterface inter = new SqlInterface();
    String dbName = "showui";

    String searchkey = request.getParameter("searchkey");
    if (searchkey != null && searchkey.trim() != "") {
        try {
            System.out.println("defaultCharset " + Charset.defaultCharset());
            System.out.println("searchkey:" + searchkey);
//            out.write("searchkey:"+ inter.getGbkSign(searchkey));
        } catch (Exception e) {
            e.printStackTrace();
            out.write(e.getMessage());
        }
    }else {
        searchkey = "";
    }

//    表名使用模块名
    String tableName = app_CurrentPath.toLowerCase().substring(1)
            .replaceAll("\\/.*", "");
    System.out.println("tablename:" + tableName);

    List<String> openlist = inter.getAllDescByKey(dbName, tableName, searchkey);
//    for (String file :
//            openlist) {
//        System.out.println(file);
//    }
    List<String> showlist = new ArrayList<String>();
%>

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

<h1>
    <a href="<%=app_basePath%>/index.jsp">首页</a>
    <%--<a href="add.jsp">添加</a>--%>
    <a href="delete.jsp" target="_blank">删除</a>
    <a href="insert.jsp" target="_blank">写入</a>
    <form name="form3" method="post" action="explorer.jsp">
        <input type="text"
               size="30"
               class="text1"
               name="searchkey"
               placeholder="请输入查询的内容"
        <%--readonly="readonly"--%>
               value=""/>
        <input type="submit" class="text1" name="Submit" value="点击查询"/>
    </form>
    <div style="background:greenyellow; color:blue">
        <%
            if(!searchkey.trim().isEmpty()) {
                out.write("查找:" + inter.getGbkSign(searchkey));
            }
        %>
    </div>

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

%>

<%
    showlist = CharacterFilter.gotHeaderSameList(openlist,"http",2,true);
    System.out.println("httpshowlist:" + showlist.size());
    for (String showstr :
            showlist) {
        String httpname = CharacterFilter.strBySpaceIndex(showstr,3,1);
        String showname = CharacterFilter.strBySpaceIndex(showstr,3,2);
        %>
<h3>
        <a href="<%=httpname%>" target="_blank"><%=showname%></a>
<br/>
</h3>
<%
    }
%>

<%
    showlist = CharacterFilter.gotHeaderSameList(openlist,"http",2,false);
//    out.write("showlist:" + showlist.size());
    System.out.println("othershowlist:" + showlist.size());
    for (String showstr :
            showlist) {
        String numname = CharacterFilter.strBySpaceIndex(showstr,2,0).trim();
        String showname = CharacterFilter.strBySpaceIndex(showstr,2,1).trim();
%>
<form name="form2" class="form2" method="post"  target="frame_right" action="<%=app_basePath%>/sql/queryidwithmodify.jsp">
    <input type="text"
           size="4"
           class="text2"
           name="iddata"
    <%--readonly="readonly"--%>
           value="<%=numname%>"/>
    <input type="submit" name="submit" value="<%=showname%>" class="submitbtn"/>
</form>
<%
    }
%>

</body>
</html>
