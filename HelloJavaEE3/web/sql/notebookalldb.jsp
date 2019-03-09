<%@ page import="java.sql.*" %>
<%-- Created by IntelliJ IDEA.
User: dell
Date: 2019/3/6
Time: 20:54
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>


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

<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>我的超级记事本(sqlite3)</title>
</head>
<body>

<%--<h1>查询结果</h1>--%>
</p>
</p>

<select>
    <option>-请选择-</option>
    <option>1111111</option>
    <option>2222222</option>
    <option>3333333</option>
</select>


<form name="form1" method="post" action="sql/notebookalldb.jsp">
    <h1>
        请输入查询数据(all.db)：<input type="text" class="text1" name="qrydata" size="80"/>
        <input type="submit" name="Submit" value="点击查询"/>
    </h1>

    <h1>
        表名称(all.db)：<input type="text" class="text1" name="tablename" size="30"/>
        <%--<input type="submit" name="Submit" value="点击查询"/>--%>
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
    <%
        String qryval = "";
        try {
            qryval = request.getParameter("qrydata");
//    out.print("查询数据项:" + qryval);
//        if (!qryval.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryval.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
        } catch (Exception e) {
            out.print("\n");
        }


        String tablenamestr = "";
        try {
            tablenamestr = request.getParameter("tablename");
            out.print("表名:" + tablenamestr);
//        if (!qryval.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryval.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
        } catch (Exception e) {
            out.print("表名为空!!!\n");
        }



        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
//        数据库地址写不正常，会报错。
            String dbpath = "jdbc:sqlite:D:/Dropbox/weidb/all.db";
            connection = DriverManager.getConnection(dbpath);

            Statement statement = connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口

            Statement stmt = null;
            ResultSet rs = null;
            String sql = "";  //查询语句
            String tablename = "";

            sql = "select name from sqlite_master where type='table' order by name;";
            ResultSet rSettable = statement.executeQuery(sql);
            while (rSettable.next()) {            //遍历这个数据集
                out.print(rSettable.getString(1));
                out.print("<br />");
            }


            if(tablenamestr.trim().isEmpty())
            {
                tablename = "c_table";
            }
            else
            {
                tablename = tablenamestr;
            }
            if (qryval.trim().isEmpty()) {
                sql = "SELECT * from " + tablename + " order by id desc limit 50;";  //查询语句
            } else {
                String sqlhead = " SELECT * FROM " + tablename + " WHERE ";
                String sqltail = " order by id desc;";
                String sqlmid = " ";
                String[] qrylst = qryval.replace("\"", "\\\"").split(" ");
                for (int lp = 0; lp < qrylst.length; lp++) {
                    sqlmid += "content like  \"%" + new String(qrylst[lp].getBytes("iso-8859-1"), "utf-8") + "%\" ";
                    if (lp != qrylst.length - 1)
                        sqlmid += " and ";

                }

                sql = sqlhead + sqlmid + sqltail;

            }
//            out.println("sql express:" + sql);
//            out.print("<br />");

            ResultSet rSet = statement.executeQuery(sql);//搜索数据库，将搜索的放入数据集ResultSet中

    %>


    <%
        int rowCount = 0;

        while (rSet.next()) {            //遍历这个数据集
            rowCount++;
    %>
    <tr>

        <td>
            <%
                String orgshowid = rSet.getString(1).replace("\n", "<br/>");
            %>
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
