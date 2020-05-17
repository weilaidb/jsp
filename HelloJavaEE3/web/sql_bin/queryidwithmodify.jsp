<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/2
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%--================page定义=========================--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<%--================引入头文件=========================--%>
<%@page import="java.sql.*" %>
<%@ page import="com.objectproc.ProcObjectAndByte" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="weilaidb.sql.SqlProc" %>  <%--导入java.sql包--%>
<%@include file="../common/basepath.jsp"%>

<script language="JavaScript">
    function Refresh()
    {
        window.location.reload();
    }
    // setTimeout('Refresh()',1000); //1秒刷新一次
</script>

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

    .boxes {
        display: block;
        margin: 0 auto;
        overflow: hidden;
        width: 550px;
        height: 100%;
        line-height: 24px;
        padding: 2px;

        min-height: 20px;
        max-height: 1000px;
        font-size: 16px;
        outline: 0;
        border: 1px solid #a0b3d6;
        line-height: 24px;
        word-wrap: break-word;
        overflow-x: hidden;
        overflow-y: auto;
        border-color: rgba(82, 168, 236, 0.8);
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
        background-color: #c8eccc;
    }
</style>

<style type="text/css">
    html, body {
        margin: 0;
    }

    div {
        padding: 40px;
    }

    input {
        width: 240px;
        height: 40px;
        line-height: 40px;
        font-size: 14px;
        border: none;
        background-color: #eee;
        border-radius: 4px;
        text-indent: 4px;
        outline: none;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }

    button {
        width: 140px;
        height: 50px;
        border: none;
        border-radius: 4px;
        outline: none;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        cursor: pointer;
    }
</style>

<html>
<head>
    <title>显示ID数据</title>
</head>
<body>
<a href="<%=app_basePath%>/index.jsp"  target="_blank">首页</a>

<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    String qryiddata = "";
    String whichbtnclick = "";
    try {
        whichbtnclick = request.getParameter("whichbutton");
        qryiddata = request.getParameter("iddata");
    } catch (Exception e) {
    }

    System.out.println("whichbtnclick:" + whichbtnclick );
    System.out.println("qryiddata    :" + qryiddata );

    try {
        Connection conn = null;
        String dbname = "alldbbin";
        conn = SqlProc.opendb(dbname);
        if (conn != null) {
%>
<form name="form1" method="post" action="modifyid.jsp">
<table border="1" width="100%" height="100%" class='mytable'>
    <%
        int whichid = Integer.valueOf(qryiddata).intValue();
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = "abcbin";
        sql = "SELECT * from " + tablename + " WHERE id=" + whichid + ";";  //查询语句

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

//        out.write("sql:" + sql);
        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
//            out.write("rowCount:" + rowCount);

            Blob blob = rs.getBlob(4);
            String toshowcontent = null;
            InputStream in = blob.getBinaryStream();
            byte[] bytes = ProcObjectAndByte.toByteArray(in);
            Object object = ProcObjectAndByte.toObject(bytes);
            System.out.println("object size:" + bytes.length
                + ", whichbtn:" + whichbtnclick);
            int showlen = 10;
            if(bytes.length <= showlen || Integer.valueOf(whichbtnclick) == 1)
            {
                toshowcontent = rs.getString(3);
//                System.out.println("toshowcontent length:" + toshowcontent.length());
            }
    %>
    <%
        if(Integer.valueOf(whichbtnclick) == 2)
        {
    %>
            <%=object%>
    <%
        }
        else
        {
    %>
            <%
                int actualrows = toshowcontent.split("\n").length;
                int maxrows = 100;
                if(actualrows < maxrows)
                {
                    actualrows = maxrows;
                }
            %>
            <tr>
                <td>

                <input type="submit" id="savetext" name="Submit" value="保存" class="submitbtn"/>
                        <input type="text" name="iddataext" value="<%=qryiddata%>">
                        <textarea class="boxes"
                        <%--rows="100%"--%>
                                  rows="<%=actualrows%>"
                                  id="ipt"
                                  name="modifythings"
                                  placeholder="输入要复制的东西"
                                  style="width: 100%;"><%=toshowcontent%>
                        </textarea>

                </td>
            </tr>

    <%
        }
    %>



    <%
                }
            } else {
                out.print("连接失败！");
            }
        } catch (Exception e) {
            out.print("请输入查询数据!!!");
        }
    %>
</table>



    <div style="overflow: hidden;position: fixed;right: 0px;bottom: 1px;z-index: 1;">
        <div style="padding-top:1px;padding-right:1px;padding-bottom:1px">
            <input type="button" id="btn_refresh" onclick="Refresh()" value="刷新" class="btns"/>
            <input type="submit" id="savetext" name="Submit" value="保存" class="btns"/>
            <%--<a href="#" styl="float: right;" class="btns">顶部</a>--%>
            <%--<div style="height:3000px;"></div>--%>
            <a href="javascript:void(0);" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;" class="btns">页顶</a>
            <a href="javascript:void(0);" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight; "搜索 class="btns">页底</a>
        </div>
    </div>

</form>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

<style type="text/css">
    .btns {
        font-weight: bold;
        display: inline-block;
        width: 100%;
        height: 100%;
        border: #5fb878;
        background: #5fb878;
        font-size: 1.6em;
        text-align: center;
        padding-top: 0px;
        color: blue;
        background-color: transparent;
    }

    a:hover {
        color: #FFFFFF
    }
</style>


</body>
</html>
