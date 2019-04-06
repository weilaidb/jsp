<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/6
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="com.mldn.lxh.vo.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<body>
<%
    Emp emp = new Emp();
    emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
    emp.setEname(request.getParameter("ename"));
    emp.setJob(request.getParameter("job"));
    emp.setHiredate(new SimpleDateFormat("yyyy-MM-dd")
            .parse(request.getParameter("hiredate")));
    emp.setSal(Float.parseFloat(request.getParameter("sal")));
    try {
        if (DAOFactory.getIEmpDAOInstance().doCreate(emp)) {
%>
<h3>雇员信息添加成功！</h3>
<%
} else {
%>
<h3>雇员信息添加失败!</h3>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


</body>
</html>
