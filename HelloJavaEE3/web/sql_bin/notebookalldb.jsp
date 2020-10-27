<%-- Created by IntelliJ IDEA.
User: dell
Date: 2019/3/6
Time: 20:54
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="weilaidb.CSqlitePub" %>


<%--================获取路径和基础路径=========================--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%--================css配置=========================--%>
<style type="text/css">
    .mytable3 th, tr, td, table {
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
        height: 20px;
    }
</style>


<script type="text/javascript">
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + (value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name)
    {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        console.log("getCookie name :" + name);
        console.log("getCookie value:" + arr[2]);
        return unescape(arr[2]);
    }
</script>

<script type="text/javascript" >
    var selectedIndex = getCookie("tablename");
    if(selectedIndex != null) {
        console.log("selectedIndex:" + selectedIndex);
        console.log("innerText    :" + document.getElementById("selecttable"));
        console.log("innerText    :" + document.getElementById("selecttable"));
        console.log("innerText    :" + document.getElementById("selecttable"));
        // console.log("innerText    :" + document.forms['form1']);
        // console.log("innerText    :" + document.forms['form1'].getElementById("selecttable"));
        // document.getElementById("select_1")[selectedIndex] = selectedIndex;
        // document.getElementById("tablename").innerText;
        // document.getElementById("select_1")
    }
</script>

<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>我的超级记事本(sqlite3)</title>
</head>
<body>


</p>
</p>


<form id="form1"  name="form1" method="post" action="sql/notebookalldb.jsp">
    <h1>
        请输入查询数据(all.db)：<input type="text" class="text1" name="qrydata" size="80"/>
        <input type="submit" name="Submit" value="点击查询" class="text1"/>

        <select class="text1" name="tablename"
                id="selecttable" onclick="setCookie('tablename',this.selectedIndex)"
                onload="getCookie('tablename')"
        <%--onchange="setCookie('select_1',this.selectedIndex)"--%>
        >
            <option  value="android">android</option>
            <option  value="aspect">aspect</option>
            <option  value="c">c</option>
            <option  value="cpp">cpp</option>
            <option  value="erlang">erlang</option>
            <option  value="go">go</option>
            <option  value="hadoop">hadoop</option>
            <option  value="java">java</option>
            <option  value="javascript">javascript</option>
            <option  value="jsp">jsp</option>
            <option  value="looktexthis">looktexthis</option>
            <option  value="mysql">mysql</option>
            <option  value="object_c">object_c</option>
            <option  value="oracle">oracle</option>
            <option  value="perl">perl</option>
            <option  value="php">php</option>
            <option  value="postgresql">postgresql</option>
            <option  value="python">python</option>
            <option  value="qt">qt</option>
            <option  value="qtquick">qtquick</option>
            <option  value="rust">rust</option>
            <option  value="shell">shell</option>
            <option  value="sqlite3">sqlite3</option>
            <option  value="swift">swift</option>
            <option  value="unittest">unittest</option>
        </select>
    </h1>


</form>

<table border="1" width="100%" class='mytable3'>
    <tr>
        <th>序列</th>
        <%--<th>名称</th>--%>
        <th>数据1</th>
        <%--<th>数据2</th>--%>
        <%--<th>数据3</th>--%>
    </tr>

    <%--<%--%>
        <%--String selecttext = "";--%>
        <%--Cookie cookie = null;--%>
        <%--Cookie[] cookies = null;--%>
        <%--// 获取cookies的数据,是一个数组--%>
        <%--cookies = request.getCookies();--%>
        <%--if( cookies != null ){--%>
<%--//            out.println("<h2> 查找 Cookie 名与值</h2>");--%>
            <%--for (int i = 0; i < cookies.length; i++){--%>
                <%--cookie = cookies[i];--%>

<%--//                out.print("参数名 : " + cookie.getName());--%>
<%--//                out.print("<br>");--%>
<%--//                out.print("参数值: " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");--%>
<%--//                out.print("------------------------------------<br>");--%>
                <%--if(cookie.getName().equals("tablenameforcookie") )--%>
                <%--{--%>
                    <%--selecttext = URLDecoder.decode(cookie.getValue(), "utf-8");--%>
                    <%--out.print("参数名 : " + cookie.getName());--%>
                    <%--out.print("<br>");--%>
                    <%--out.print("参数值: " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");--%>
                    <%--out.print("------------------------------------<br>");--%>
                    <%--break;--%>
                <%--}--%>
            <%--}--%>
        <%--}else{--%>
<%--//            out.println("<h2>没有发现 Cookie</h2>");--%>
        <%--}--%>

    <%--%>--%>


    <%
        String qryval = request.getParameter("qrydata");
        if(null == qryval)
        {
            qryval = "c";
        }

        String temptable = request.getParameter("tablename");
        if(null == temptable || temptable.isEmpty())
        {
            temptable = "c";
        }
        System.out.println("temptable:" + temptable);

        String tablenamestr = "";
        try {
            String sufixtable = "_table";
            tablenamestr = temptable + sufixtable;
            out.print("表名:" + tablenamestr);
            Cookie tablenameforck = new Cookie("tablenameforcookie",
                    tablenamestr);
            response.addCookie( tablenameforck );


            request.getParameter("tablename");

        } catch (Exception e) {
            out.print("表名为空!!!\n");
        }


        String sql = "";  //查询语句
        String tablename = "";
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            String dbpath = CSqlitePub.getSqliteWholePath();
            connection = DriverManager.getConnection(dbpath);
            Statement statement = connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口

            if(tablenamestr.trim().isEmpty())
            {
                tablename = "c_table";
            }
            else
            {
                tablename = tablenamestr;
            }
            boolean isfull = false;
            if (qryval.trim().isEmpty()) {
                sql = "SELECT * from " + tablename + " order by id desc limit 50;";  //查询语句
                isfull = true;
            } else {
                sql = "SELECT * from " + tablename + " order by id desc;";  //查询语句
            }

            ResultSet rSet = statement.executeQuery(sql);//搜索数据库，将搜索的放入数据集ResultSet中

    %>


    <%
        int rowCount = 0;

        while (rSet.next()) {            //遍历这个数据集
            String orgshowid = "";
            String orgcontent = "";
            String orgcontentnew = "";
            String qryvalnew = "";
            orgshowid = rSet.getString(1);
            orgcontent = rSet.getString(2);
            qryvalnew = new String(qryval.trim().getBytes("iso-8859-1"), "utf-8");

            if(isfull)
            {
                orgcontent = rSet.getString(2).replace("\n", "<br/>");
                rowCount++;
            }
            else
            {
                String[] qrylst = qryval.trim().replace("\"", "").split(" ");
                int qrynums = 0;
                for (int lp = 0; lp < qrylst.length; lp++) {
                    qryvalnew = new String(qrylst[lp].trim().getBytes("iso-8859-1"), "utf-8");
                    if(orgcontent.toLowerCase().contains(qryvalnew.toLowerCase()))
                    {
                        qrynums++;
                    }
                }

                if(qrynums != qrylst.length)
                {
                    continue;
                }
                rowCount++;

            }
    %>
    <tr>

        <td>
            <form name="form2" method="post" action="sql/notebookqueryid.jsp">
                <input type="text"
                       size="4"
                       class="text2"
                       name="iddata"
                <%--readonly="readonly"--%>
                       value="<%=orgshowid%>"/>
                <input type="submit" name="Submit" value="More"/>
            </form>
        </td>

        <%
            String showcontent = rSet.getString(2)
                    .replaceAll("<[.[^<\n]]*>", "")
                    .replace("\n", "<br/>");
            int showlen = 500;
            long totallen = showcontent.length();
            if (showcontent.length() > showlen) {
                showcontent = showcontent.substring(0, showlen);
            }
            long curlen = showcontent.length();
            if (totallen == 0) {
                totallen = 100;
            }
            String appendstr = "ShowRate:" + (curlen * 100 / totallen) + "%";
            if (totallen == 0 || ((curlen * 100 / totallen) == 100)) {
                appendstr = "";
            } else {
                appendstr = "<h3 color=red>" + appendstr + "</h3>";
            }
        %>
        <td><%=showcontent + "<br/><br/><br/>" + appendstr%>
        </td>
    </tr>

    <%
            }
            rSet.close();//关闭数据集
            connection.close();//关闭数据库连接
            out.print("查询结果：" + rowCount + " 条["
                    + new String(qryval.getBytes("iso-8859-1"), "utf-8")
                    + "]");
            out.print("<br/>");
        } catch (Exception e) {
            out.println("Opened database failed");
            out.print("<br />");
            out.println(e.getClass().getName() + ": " + e.getMessage());
            out.print("<br />");
        }
    %>
</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>


</body>
</html>
