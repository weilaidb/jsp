<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/25
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>TestJavaBean实例</title>
</head>
<body>
<h2>Jsp 使用 JavaBean 实例</h2>
<jsp:useBean id="testbean" class="com.runoob.main.TestBean" />

<jsp:setProperty name="testbean"
                 property="message"
                 value="高手一步一步来的..." />

<jsp:setProperty name="testbean" property="type" value="12220"/>

<p>输出信息....</p>

<jsp:getProperty name="testbean" property="message" />
</p>

<jsp:getProperty name="testbean" property="type" />


</body>
</html>
