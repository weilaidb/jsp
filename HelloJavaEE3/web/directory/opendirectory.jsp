<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/3
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<html>
<head>
    <title>遍历文件目录</title>
    <style type="text/css">
        ul {
            list-style: none;
        }

        li {
            float: left;
            margin-left: 20px;
            margin-top: 20px;
        }

        body {
            text-align: center;
            font-size: 15px;
        }

        a {
            font-size: 22px;
        }

        a:link, a:visited {
            color: #06C;
            text-decoration: none;
        }

        a:hover {
            color: #f00;
        }
    </style>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
    <script type="text/javascript">
        $(function() {
            var name = $("#names").val();
            $("#data").html("");
            $("#data").append(name)
        });
    </script>

    <script type="javascript">
        function browseFolder(path) {
            try {
                var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
                var Shell = new ActiveXObject("Shell.Application");
                var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
                //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
                if (Folder != null) {
                    Folder = Folder.items(); // 返回 FolderItems 对象
                    Folder = Folder.item(); // 返回 Folderitem 对象
                    Folder = Folder.Path; // 返回路径
                    if (Folder.charAt(Folder.length - 1) != "\\") {
                        Folder = Folder + "\\";
                    }
                    document.getElementById(path).value = Folder;
                    return Folder;
                }
            }
            catch (e) {
                alert(e.message);
            }
        }

    </script>

</head>
<body>

<%--<%!StringBuffer result = new StringBuffer();%>--%>

<%--<%--%>
<%--    String url = request.getRequestURL().toString();--%>
<%--    if (url.endsWith("/")) {--%>
<%--        url = url.substring(0, url.length());--%>
<%--    }--%>
<%--    url = url.substring(url.lastIndexOf("/") + 1);--%>

<%--    String path = request.getRealPath(url);--%>
<%--    File dir = new File(path + "/");--%>
<%--    String[] fileNames = null;--%>
<%--    if (dir.exists()) {--%>
<%--        if (dir.isDirectory()) {--%>
<%--            fileNames = dir.list();--%>
<%--        } else {--%>
<%--            fileNames = dir.getParentFile().list();--%>
<%--        }--%>
<%--    }--%>

<%--    if(null == fileNames)--%>
<%--    {--%>
<%--        System.out.println("null filename");--%>
<%--    }--%>
<%--    else--%>
<%--    {--%>
<%--//    out.write(fileNames.toString());--%>
<%--        System.out.println(fileNames.toString());--%>
<%--//    return;--%>
<%--    }--%>


<%--//    result = new StringBuffer();--%>
<%--//    for (String str : fileNames) {--%>
<%--//        if (str != null)--%>
<%--//            result.append("<li><a href='" + str + "'>" + str + "</a></li>");--%>
<%--//    }--%>
<%--%>--%>

<table>
    <tr>
        <td>选择导入数据源：</td>
        <td><input id="path" type="text" name="path" size="30"></td>
        <td><input type=button value="选择" onclick="browseFolder('path')"></td>
    </tr>
</table>


<%--<div id="main">--%>
<%--    <h1>文件列表</h1>--%>
<%--    <input type="hidden" id="names" value="<%=result%>" />--%>
<%--    <ul id="data"></ul>--%>
<%--</div>--%>
</body>
</html>
