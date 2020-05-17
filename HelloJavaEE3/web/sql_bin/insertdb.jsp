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
<%@ page import="com.clipboard.ProcClipboard" %>
<%--<%@ page import="org.apache.taglibs.standard.lang.jstl.NullLiteral" %>--%>
<%@ page import="com.objectproc.ProcObjectAndByte" %>
<%@ page import="java.io.*" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="com.timedate.DateTimePub" %>
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

    .submitbtn {
        height: 30px;
        width: 80px;
    }

    .dia_wbkbig {
        width: 100%;
        height: 80%;
        alignment: center;
        align-content: center;
    }
    .textarea_content {
        width: 100%;
        height: 1%;
        alignment: left;
        align-content: normal;
    }


</style>

<%--================获取路径和基础路径=========================--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <%--================javascript定义=========================--%>
    <script>
        function ClearTextArea() {
            document.getElementById("id_insertdb").value = "";
        }

        function CopyToClipBoard(txt) {
            var clipBoardContent = txt;
            window.top.clipboardData.setData("Text", clipBoardContent);
        }

        function ClipBoard2TextArea() {
            var clipboardContent = "abcfd";
            // var clipboardContent = window.top.clipboardData.getData("text");
            console.log(clipboardContent);
            document.getElementById("id_insertdb").value = clipboardContent;
        }

        //覆盖浏览器粘贴事件
        document.addEventListener('paste', function (e) {
            var clipboardData = e.clipboardData;
            // console.log("paste event!!")
            if (!(clipboardData && clipboardData.items)) {//是否有粘贴内容
                return;
            }
            for (var i = 0, len = clipboardData.items.length; i < len; i++) {
                var item = clipboardData.items[i];
                console.log("king:" + item.kind + ", type:" + item.type);
                if (item.kind === "string" && item.type == "text/plain") {
                    item.getAsString(function (str) {
                        // str 是获取到的字符串,创建文本框
                        //处理粘贴的文字内容
                    })
                    var pasteString = item.getAsString();
                    console.log("text:" + pasteString)
                }else if (item.kind === "string" && item.type == "text/html")
                {
                    var pasteFile = item.getAsFile();
                    console.log("html:" + pasteFile)
                }

                else if (item.kind === "file") {//file 一般是各种截图base64数据
                    var pasteFile = item.getAsFile();
                    // pasteFile就是获取到的文件
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        var base64Img = event.target.result;
                    }; // data url
                    reader.readAsDataURL(pasteFile);
                }
                // var copy_content = e.clipboardData.getData('text/plain');
                var copy_content = e.clipboardData.getData('text/html');

            }
        })

        document.addEventListener("paste", function (e) {
            // console.log(e.clipboardData.getData("text"));
            document.getElementById("id_insertdb").value = e.clipboardData.getData("text");
            document.getElementById("id_content").value = e.clipboardData.getData("text/html");
        });

        document.onkeydown = function (e) {
            if (e.ctrlKey && e.keyCode == 67) {//ctrl+C
                // console.log("ctrl + C");
                function handler(event) {
                    // console.log("ctrl + C22");
                    // var cliptext = event.clipboardData.getData('text/plain');
                    var cliptext = event.clipboardData.getData('text/plain');
                    // console.log(cliptext);
                    // console.log("afdf");
                    // console.log(event.clipboardData.getData('text'));
                    // event.clipboardData.setData('text/plain', "自定义复制内容");
                    document.removeEventListener('copy', handler, true);
                    event.preventDefault();
                }

                document.addEventListener('copy', handler, true);
                // document.execCommand('copy');
            }
        }

        document.onmousedown = function (ev) {
            // console.log(ev);
            // document.getElementById("id_insertdb").value = ev.toString();

        }

    </script>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>输入数据(mysql bin)</title>
</head>
<body onload="ClearTextArea()">
<a href="<%=basePath%>/index.jsp" target="_blank">首页</a>
<a href="<%=basePath%>/sql/insertdb.jsp">插入</a>

<form name="form1" method="post" action="">
    <h3>
        请输入保存数据：
        <input type="submit" name="Submit" value="点击保存" class="submitbtn"/>
        <input type="button" id="id_cleararea" name="cleararea" value="清空" class="submitbtn"
               onclick="ClearTextArea()">
        <%--<input type="button" id="id_paste2area" name="paste2area" value="粘贴" class="submitbtn"--%>
        <%--onclick="ClipBoard2TextArea()"/>--%>
        <br/>
        <textarea id="id_insertdb" name="insertdbname"
                  class="dia_wbkbig">
        </textarea>
        <textarea id="id_content" name="insertdbcontent"
                  class="textarea_content">
        </textarea>
    </h3>
</form>


<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    String insertval = "";
    String insertdbcontent = "";
    String sql = "";  //查询语句
    String tablename = "abcbin";
    PreparedStatement preparedStatement = null;
%>

<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    insertval = "";
    insertdbcontent = "";
    try {
        insertval = request.getParameter("insertdbname");
        insertdbcontent = request.getParameter("insertdbcontent");
    } catch (Exception e) {
    }


%>

<%
    try {
        String dbname = "alldbbin";
        conn = SqlProc.opendb(dbname);
        if (conn != null) {
        }
    } catch (Exception e) {
        out.println("数据库连接失败<br/>");
        return;
    }

%>
<%
    byte[] objbyte = null;
%>

<%
    try {
        insertval = new String(insertval.getBytes("iso-8859-1"), "utf-8");
        insertval = insertval.replace("\"", "\"\"");
        insertval = insertval.replace("\\", "\\\\");
        insertval = insertval + DateTimePub.getCurrentDateTimeMultiLine();
        String nameval = insertval.substring(0, insertval.length() > 100 ? 100 : insertval.length())
                + System.currentTimeMillis();
        /**
         * 由于JSP是运行有后台，无法从网页处获取剪切板的内容，所以不能在后台获取剪切板的数据，
         * 仍然使用JS进行数据传递。
         */
//        Object object1 = ProcClipboard.getAll4Clipboard();
        Object object1 = new String(insertdbcontent.getBytes("iso-8859-1"), "utf-8");;
//        Object object1 = ProcClipboard.getImageAndText4Clipboard();
//        Object object1 = ProcClipboard.getselectionHtmlFlavor4Clipboard();
//        Object object1 = ProcClipboard.getstringFlavor4Clipboard();
        objbyte = ProcObjectAndByte.toByteArray(object1);
        InputStream inputStream = new ByteArrayInputStream(objbyte);
        if (!insertval.isEmpty()) {
            sql = "insert into " + tablename + "(id, name, content, content_bin) " +
                    "VALUES(? ,?,?,?)";  //执行语句
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1,0);
            preparedStatement.setString(2,nameval);
            preparedStatement.setString(3,insertval);
            preparedStatement.setBlob(4, inputStream);
            preparedStatement.executeUpdate();

        } else {
            out.println("数据为空!!<br />");
            return;
        }

//        out.write("sql:" + sql);
//        stmt = conn.createStatement();
//        stmt.execute(sql);
        preparedStatement.close();
        rs.close();
        stmt.close();
        conn.close();
        out.println("写入成功!! size: " + objbyte.length + "<br />");
        return;

    } catch (Exception e) {
        if (insertval != null && !insertval.isEmpty()) {
            if (null == e.getMessage()) {
//                out.println("写入成功吧!!<br />");
                out.println("写入成功!! size: " + objbyte.length + "<br />");
            } else {
                out.println("写入异常!!!!!! " + e.getMessage());
            }
        } else {
            out.println("数据为空!!<br />");
        }
    }
%>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

</body>
</html>

