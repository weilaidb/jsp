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
    <%--<script src="../javascript/zeroclipboard-1.3.5/ZeroClipboard.js">--%>
        <%--function PasteTextArea() {--%>
            <%--// if (navigator.userAgent.indexOf("MSIE") == -1)--%>
            <%--// {--%>
            <%--//     alert("您的浏览器不支持此功能,请手工复制文本框中内容");--%>
            <%--//     return false;--%>
            <%--// }--%>
            <%--ZeroClipboard--%>
            <%--var content = window.clipboardData.getData("Text");--%>
            <%--// var content = clipboardData.getData("Text");--%>
            <%--if (content!=null) {--%>
                <%--document.getElementById("id_insertdb").value  = content;                // document.write("</span>");}--%>
            <%--}--%>
            <%--// document.getElementById("id_insertdb").value = "aaaa";--%>
        <%--}--%>
    <%--</script>--%>


    <script>
        function ClearTextArea() {
            document.getElementById("id_insertdb").value = "";
        }

        function OnTextAreaFocus()
        {
            console.log("OnTextAreaFocus");
            if(document.hasFocus())
            {
                console.log("have Focus");
                return;
            }
            document.removeEventListener("paste",         function (e) {
                // console.log(e.clipboardData.getData("text"));
                console.log("paste insertext... @ focus")
                // document.getElementById("id_insertdb").value = e.clipboardData.getData("text");
            });
            document.removeEventListener(onkeydown, function (e) {
                if (e.ctrlKey && e.keyCode == 67) {//ctrl+C
                    console.log("ctrl + C");
                    function handler(event) {
                        // var cliptext = event.clipboardData.getData('text/plain');
                        // document.removeEventListener('copy', handler, false);
                        // event.preventDefault();
                    }
                    // document.addEventListener('copy', handler, false);
                    // document.execCommand('copy');
                }
            });
        }
        function OnTextAreaBlur() {
            console.log("OnTextAreaBlur");
            document.addEventListener("paste",         function (e) {
                // console.log(e.clipboardData.getData("text"));
                console.log("paste insertext...")
                document.getElementById("id_insertdb").value = e.clipboardData.getData("text");
            });
            document.addEventListener(onkeydown, function (e) {
                if (e.ctrlKey && e.keyCode == 67) {//ctrl+C
                    console.log("ctrl + C");
                    function handler(event) {
                        var cliptext = event.clipboardData.getData('text/plain');
                        document.removeEventListener('copy', handler, true);
                        event.preventDefault();
                    }
                    // document.addEventListener('copy', handler, true);
                    // document.execCommand('copy');
                }
            });
        }


        //
        // //覆盖浏览器粘贴事件
        // document.addEventListener('paste', function (e) {
        //     var clipboardData = e.clipboardData;
        //     // console.log("paste event!!")
        //     if (!(clipboardData && clipboardData.items)) {//是否有粘贴内容
        //         return;
        //     }
        //     for (var i = 0, len = clipboardData.items.length; i < len; i++) {
        //         var item = clipboardData.items[i];
        //         if (item.kind === "string" && item.type == "text/plain") {
        //             item.getAsString(function (str) {
        //                 // str 是获取到的字符串,创建文本框
        //                 //处理粘贴的文字内容
        //             })
        //         } else if (item.kind === "file") {//file 一般是各种截图base64数据
        //             var pasteFile = item.getAsFile();
        //             // pasteFile就是获取到的文件
        //             var reader = new FileReader();
        //             reader.onload = function (event) {
        //                 var base64Img = event.target.result;
        //             }; // data url
        //             reader.readAsDataURL(pasteFile);
        //         }
        //         var copy_content = e.clipboardData.getData('text/plain');
        //
        //     }
        // })

        // document.addEventListener("paste", function (e) {
        //     // console.log(e.clipboardData.getData("text"));
        //     console.log("paste insertext...")
        //     document.getElementById("id_insertdb").value = e.clipboardData.getData("text");
        // });

        // document.onkeydown = function (e) {
        //     if (e.ctrlKey && e.keyCode == 67) {//ctrl+C
        //         // console.log("ctrl + C");
        //         function handler(event) {
        //             // console.log("ctrl + C22");
        //             // var cliptext = event.clipboardData.getData('text/plain');
        //             var cliptext = event.clipboardData.getData('text/plain');
        //             // console.log(cliptext);
        //             // console.log("afdf");
        //             // console.log(event.clipboardData.getData('text'));
        //             // event.clipboardData.setData('text/plain', "自定义复制内容");
        //             document.removeEventListener('copy', handler, true);
        //             event.preventDefault();
        //         }
        //
        //         // document.addEventListener('copy', handler, true);
        //         // document.execCommand('copy');
        //     }
        // }

        // document.onmousedown = function (ev) {
        //     // console.log(ev);
        //     // document.getElementById("id_insertdb").value = ev.toString();
        //
        // }



    </script>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>输入数据(mysql)</title>
</head>
<body onload="ClearTextArea()">
<a href="<%=basePath%>/index.jsp">首页</a>

<form name="form1" method="post" action="">
    <h3>
        请输入保存数据：
        <input type="submit" name="Submit" value="点击保存" class="submitbtn"/>
        <input type="button" name="Paste" value="粘贴" class="submitbtn"
            onclick="PasteTextArea()"/>
        <input type="button" id="id_cleararea" name="cleararea" value="清空" class="submitbtn"
               onclick="ClearTextArea()">
        <%--<input type="button" id="id_paste2area" name="paste2area" value="粘贴" class="submitbtn"--%>
        <%--onclick="ClipBoard2TextArea()"/>--%>
        <br/>
        <textarea id="id_insertdb" name="insertdbname"
                  class="dia_wbkbig" onfocus="OnTextAreaFocus()"
                  onblur="OnTextAreaBlur()">
        </textarea>
    </h3>
</form>


<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    String insertval = "";
    String sql = "";  //查询语句
    String tablename = "abc";
%>

<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    insertval = "";
    try {
        insertval = request.getParameter("insertdbname");
    } catch (Exception e) {
    }


%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        conn = DriverManager.getConnection(url, username, password);  //连接状态

        if (conn != null) {
        }
    } catch (Exception e) {
        out.println("数据库连接失败<br/>");
        return;
    }

%>

<%
    try {
        insertval = new String(insertval.getBytes("iso-8859-1"), "utf-8");
        insertval = insertval.replace("\"", "\"\"");
        insertval = insertval.replace("\\", "\\\\");
        String nameval = insertval.substring(0, insertval.length() > 100 ? 100 : insertval.length())
                + System.currentTimeMillis();
        if (!insertval.isEmpty()) {
            sql = "insert into " + tablename + "(id, name, content)" +
                    "VALUES(" +
                    "NULL" +
                    "," +
                    "\"" +
                    nameval +
                    "\"" +
                    "," +
                    "\"" +
                    insertval +
                    "\"" +
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
        out.println("写入成功!!<br />");
        return;

    } catch (Exception e) {
        if (insertval != null && !insertval.isEmpty()) {
            if (null == e.getMessage()) {
                out.println("写入成功!!<br />");
            } else {
                out.println("写入异常!! " + e.getMessage());
            }
        } else {
            out.println("数据为空!!<br />");
        }
    }
%>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

</body>
</html>

