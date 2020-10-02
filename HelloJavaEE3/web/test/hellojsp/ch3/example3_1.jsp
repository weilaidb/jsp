<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/2 0002
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="beijing" %>
<%@taglib tagdir="/WEB-INF/tags/geng" prefix="dalian" %>
<html>
<head>
    <title>Tag</title>
</head>
<body bgcolor="#00ffff">
<h3>以下是调用Tag文件的效果：</h3>
<beijing:AddSum />
<h3>以下是调用Tag文件的效果:</h3>
<dalian:EvenSum/>
<%--<dalian:EvenSum/>--%>



</body>
</html>
