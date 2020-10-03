<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/3 0003
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="show" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Sort</title>
</head>
<body bgcolor="#00ffff">
<%
    LinkedList listName  = new LinkedList();
    LinkedList listScore = new LinkedList();
    listName.add("张三");
    listScore.add(new Double(87));
    listName.add("李四");
    listScore.add(new Double(65));
    listName.add("刘小小");
    listScore.add(new Double(57));
    listName.add("五大林");
    listScore.add(new Double(99));
    listName.add("孙地步");
    listScore.add(new Double(88));
%>

<p>成绩单:
<show:Sort listName="<%=listName%>" listScore="<%=listScore%>" title="姓名" item="高等数学"></show:Sort>
</p>


</body>
</html>
