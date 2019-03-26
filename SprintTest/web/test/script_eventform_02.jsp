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
    <title>script demo 01</title>
    <script language="JavaScript">
        function validate(f) {
            var value=f.email.value;
            if(!/^\w+@\w+.\w+$/.test(value))
            {
                alert("EMAIL输入格式不正确!");
                f.email.focus();
                f.email.select();
                return false;
            }
            return true;
        }
    </script>
</head>
<body >
<form action="" method="post" name="myform" onsubmit="return validate(this)">
    EMAIL:<input type="text" name="email">
    <input type="submit" value="提交">
</form>

</body>
</html>








































