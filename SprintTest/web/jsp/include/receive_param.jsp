<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<h1>参数一:<%=new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8")%></h1>
<%--<h1>参数一:<%=request.getParameter("name")%></h1>--%>
<h1>参数二:<%=request.getParameter("info")%></h1>


