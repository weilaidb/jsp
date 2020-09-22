<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/23
  Time: 0:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Email</title>
</head>
<body bgcolor="#00ffff"><font size="3">
    <p>请输入E-mail:<br>
    <form action="" method="get" name="form">
        <input type="text" name="client" value="请输入E-mail">
        <input type="submit" value="送出" name="submit">
    </form>

    <% String str = request.getParameter("client");
        if (str != null) {
            int index = str.indexOf("@");
            if (index == -1) {
    %>
    <br>你的E-Mail地址中没有@
    <%
    } else {
        int start = str.indexOf("@");
        int end = str.lastIndexOf("@");
        if (start != end) {
    %>
    <br>你的E-mail地址有两个以上的符号：@。
    <%
    } else {
        out.println("<br>" + str);
    %>
    <br> 你的E-mail地址书写正确。
    <%
                }
            }
        }

    %>
    </p>


</font>
</body>
</html>
