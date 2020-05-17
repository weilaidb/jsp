<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
<%@ page import="com.commmon.SqlInterface" %>
<%@ page import="weilaidb.sql.JspAdapter" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="com.net.CheckIp" %>

<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/19
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@include file="../../common/basepath.jsp"%>
<%--================css配置=========================--%>
<link href="../../css/explorer.css" rel="stylesheet" type="text/css">

<%
    //    打开的文件列表
//    增加表项openlist，用以打开文件路径
    SqlInterface inter = new SqlInterface();
    String dbName = SqlProc.getDbnameShowUi();
    String tableName = JspAdapter.jspGetTableNameByAppPath(app_CurrentPath);
%>

<%
    //获取处理列表
    List<String> openlist = inter.getAllDesc(dbName, tableName, "");
//    for (String file :
//            openlist) {
//        System.out.println(file);
//    }

%>

<html>
<head>
    <title><%=JspAdapter.getJspTitleByKey(tableName)%></title>
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

<h1><a href="<%=app_basePath%>/index.jsp"  target="_blank">首页</a>
    <a href="../delete.jsp?tableName=<%=tableName%>" target="_blank">删除</a>
    <a href="../insert.jsp?tableName=<%=tableName%>&pinyin=no" target="_blank">写入</a>
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
    String ipaddr = "";
    String cmddata = "";

    for (String file :
            openlist) {
        String[] splitlst = file.split("\\s+", 2);
        if((splitlst.length < 2) || (0 != CheckIp.ipMatches(splitlst[0].trim())))
        {
            ipaddr = "localhost";
            cmddata = file;
        }
        else
        {
            ipaddr = splitlst[0].trim();
            cmddata = splitlst[1].trim();
        }
//        /**
//         * 第一个不为索引的不处理
//         */
//        if(false == isNumeric(splitlst[0].trim()))
//        {
//            continue;
//        }
%>
<%--发送时发送的数据是name=value--%>
<form name="form2" method="get" action="executor.jsp">
    <input type="text"
           size="4"
           class="text2"
           name="iddata"
    <%--readonly="readonly"--%>
           value="<%=splitlst[0].trim()%>"/>
    <input type="submit" id="execcmdbtn"  name="execcmdbtn"  value="发送"  class="executorsubmitbtn"/>
    <input type="text"   id="ipaddr" name="ipaddr" value="<%=ipaddr%>" class="ipaddrtext"/>
    <input type="text"   id="cmddatatext" name="cmddatatext" value="<%=cmddata%>" class="text3"/>

<%--    <input type="submit" name="submit" value="保存" class="executorsubmitbtn"/>--%>

<%--    <input type="submit" name="submit" value="<%=splitlst[1].trim()%>" class="executorsubmitbtn"/>--%>
    <%--        <input type="text" name="iddataext" value="<%=qryiddata%>">--%>
<%--            <textarea class="boxes"--%>
<%--            &lt;%&ndash;rows="100%"&ndash;%&gt;--%>
<%--                      rows="<%=actualrows%>"--%>
<%--                      id="ipt"--%>
<%--                      name="modifythings"--%>
<%--                      placeholder="输入要复制的东西"--%>
<%--                      style="width: 100%;"><%=toshowcontent%>--%>
<%--                            </textarea>--%>
</form>

</h3>

<%
    }
%>

</body>
</html>
