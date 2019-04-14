<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/11
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%--================css配置=========================--%>
<style type="text/css">
    body{
        text-align: center;
    }

</style>

<html>
<head>
    <title>Title</title>
</head>
<script>
    function validate(f) {
        if (!(/^\w{5,15}$/.test(f.userid.value))) {
            alert("用户ID必须是5~15位!")
            f.userid.focus();
            return false;
        }
        if (!(/^\w{5,15}$/.test(f.userpass.value))) {
            alert("用户密码必须是5~15位!")
            f.userpass.focus();
            return false;
        }
        return true;
    }
</script>
<body>
<h2>用户登陆程序</h2>

<%
    request.setCharacterEncoding("utf-8");
%>
<%
    List<String> info = (List<String>) request.getAttribute("info");
    if (info != null) {
        Iterator<String> iter = info.iterator();
        while (iter.hasNext()) {
%>
            <h4><%=iter.next()%>
            </h4>
<%
        }
    }
%>
<%
    String basePath = application.getContextPath();
    String basePathext = request.getContextPath();
    String baseRealPath = application.getRealPath("/");
%>
<form action="<%=basePathext%>/BSelectDb" method="post"
      onsubmit="return validate(this)">
    用户ID&nbsp<input type="text" name="userid"><br>
    密&nbsp&nbsp&nbsp&nbsp码&nbsp<input type="password" name="userpass"><br>
    <input type="submit" value="登陆">
    <input type="reset" value="重置">
</form>

</body>
</html>
