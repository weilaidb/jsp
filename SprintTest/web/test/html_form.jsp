<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/25
  Time: 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%int seq=3;%>
    <title>html show 0<%=seq%>form</title>
</head>
<body>
<form action="" method="post">
    编号:<input type="text" name="userid" value="NO." size="2" maxlength="2"><br>
    用户名:<input type="text" name="username" value="请输入用户名"><br>
    密码:<input type="password" name="userpass" value="请输入密码"><br>
    性别:<input type="radio" name="sex" value="男" checked>男
    <input type="radio" name="sex" value="女">女<br>
    部门:<select name="dept">
    <option value="技术部">技术部</option>
    <option value="销售部" SELECTED>销售部</option>
    <option value="财务部">财务部</option>

</select><br>
    兴趣:<input type="checkbox" name="inst" value="唱歌">唱歌
    <input type="checkbox" name="inst" value="游泳">游泳
    <input type="checkbox" name="inst" value="跳舞">跳舞
    <input type="checkbox" name="inst" value="编程">编程
    <input type="checkbox" name="inst" vlaue="上网" checked>上网<br>

    说明:<textarea name="note" cols="30" rows="3">
    北京北京
</textarea>
    <input type="submit" value="注册"><input type="reset" value="重置">
</form>
</body>
</html>








































