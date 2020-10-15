<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="renew" tagdir="/WEB-INF/tags/student" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags/student" %>
<html>
<head>
    <title>newResult</title>
</head>
<body bgcolor="#ffc0cb">
<font size="4">
<%
    String na = request.getParameter("name");
    String num = request.getParameter("number");
    String mT = request.getParameter("birthday");
    String email = request.getParameter("email");
    if(null == num ){
        num = "";
    }

    if(null == mT ){
        mT = "";
    }

    if(null == email ){
        email = "";
    }

    byte bb[] = num.getBytes("GBK");
    num = new String(bb);

%>
    <renew:NewRecord number="<%=num%>" name="<%=na%>" birthday="<%=mT%>" email="<%=email%>"></renew:NewRecord>
    <br>message表更新后的数据记录是:
    <renew:NameCondition name=""/>
    <br><%=queryResultByName%>
</font>


</body>
</html>
