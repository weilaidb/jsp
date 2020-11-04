<%@ page import="base.CStringPub" %>
<%@ page import="file.CFilePub" %>
<%@ page import="java.util.List" %>
<%@ page import="codec.CCodecPub" %>
<%@ page import="sql.CSqlitePub" %><%--
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
    <meta name="viewport2" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="showui">
    <a href="autojcode.jsp">您好啊</a>
    <a href="sql/sqlite/index.jsp" target="frame_right">从这里开始</a></p>
    <a href="sql/sqlite/link/links.jsp" target="frame_right">常用链接</a></p>
    <a href="sql/sqlite/showtables.jsp" target="frame_right">查看表</a></p>
    <a href="sql/sqlite/querydatabase.jsp" target="frame_right">查询数据库</a></p>
    <a href="file/index.jsp" target="_blank">AutoJCode</a></p>
</div>


<%--<%--%>
<%--    String dirpath = CSqlitePub.getAutoJcodePathFromFile(CSqlitePub.getDirnameautojcode(), CSqlitePub.getFilenameautojcode());--%>
<%--%>--%>
<%--<font size="3">--%>
<%--&lt;%&ndash;    <form action="" method="post" name="form" accept-charset="gbk">&ndash;%&gt;--%>

<%--    <form action="" method="post" name="form" >--%>
<%--        输入解析的文件夹路径（绝对路径）:<input type="text" name="dir" value="<%=dirpath%>"><br>--%>
<%--        输入解析的标准文件名（相对路径）:<input type="text" name="filenamestd" value="selfmenu.txt"><br>--%>
<%--        输入解析的扩展文件名（相对路径）:<input type="text" name="filenameext" value="selfmenu_user.txt"><br>--%>
<%--        <input type="submit" value="解析" name="submit">--%>
<%--    </form>--%>
<%--</font>--%>

<%--<%--%>
<%--    String dir = CStringPub.requesParaIfNullSetEmpty(request, "dir");--%>
<%--    String filenamestd = CStringPub.requesParaIfNullSetEmpty(request, "filenamestd");--%>
<%--    String filenameext = CStringPub.requesParaIfNullSetEmpty(request, "filenameext");--%>
<%--%>--%>

<%--<%--%>
<%--    List<String> resultsstd = CFilePub.getCOntentFromFile(dir, filenamestd);--%>
<%--    List<String> resultsext = CFilePub.getCOntentFromFile(dir, filenameext);--%>
<%--    resultsstd.addAll(resultsext);--%>
<%--    for (String item:--%>
<%--            resultsstd) {--%>
<%--%>--%>
<%--<form action="showfile.jsp" method="get" name="form" >--%>
<%--    <input type="submit" value="查看" name="submit">--%>
<%--    <%=item%>--%>
<%--</form>--%>

<%--<%--%>
<%--    }--%>
<%--%>--%>


</body>
</html>
