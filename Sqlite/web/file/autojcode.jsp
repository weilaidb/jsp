<%@ page import="base.CStringPub" %>
<%@ page import="file.CFilePub" %>
<%@ page import="java.util.List" %>
<%@ page import="codec.CCodecPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/11/3
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>AutoJCode</title>
</head>
<body>
<font size="3">
<%--    <form action="" method="post" name="form" accept-charset="gbk">--%>
    <form action="" method="post" name="form" >
        输入解析的文件夹路径（绝对路径）:<input type="text" name="dir"><br>
        输入解析的标准文件名（相对路径）:<input type="text" name="filenamestd" value="selfmenu.txt"><br>
        输入解析的扩展文件名（相对路径）:<input type="text" name="filenameext" value="selfmenu_user.txt"><br>
<%--        <input type="hidden" name="database" value="<%=database%>">--%>
<%--        <input type="hidden" name="table" value="<%=table%>">--%>
<%--        <input type="hidden" name="columns" value="ID,content">--%>
<%--        <input type="checkbox" name="item" value="limit" checked="checked">限制--%>
<%--        <input type="checkbox" name="order" value="order" checked="checked">反序--%>
<%--        <input type="checkbox" name="showlittle" value="showlittle" checked="checked">缩略显示--%>
        <input type="submit" value="解析" name="submit">
    </form>
</font>

<%
    String dir = CStringPub.requesParaIfNullSetEmpty(request, "dir");
    String filenamestd = CStringPub.requesParaIfNullSetEmpty(request, "filenamestd");
    String filenameext = CStringPub.requesParaIfNullSetEmpty(request, "filenameext");
%>

<%
    List<String> resultsstd = CFilePub.getCOntentFromFile(dir, filenamestd);
    List<String> resultsext = CFilePub.getCOntentFromFile(dir, filenameext);
    resultsstd.addAll(resultsext);
    for (String item:
            resultsstd) {
%>
    <%=item%><br>
<%
    }
%>


</body>
</html>
