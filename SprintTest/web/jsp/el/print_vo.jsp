<%@ page import="com.el.Dept" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/15
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Dept dept = new Dept();
    dept.setDeptno(10);
    dept.setDname("NLDM教学部");
    dept.setLoc("北京市教学区");
    request.setAttribute("deptinfo", dept);
%>

<h3>部门编号:${deptinfo.deptno}</h3>
<h3>部门名称:${deptinfo.dname}</h3>
<h3>部门位置:${deptinfo.loc}</h3>

</body>
</html>
