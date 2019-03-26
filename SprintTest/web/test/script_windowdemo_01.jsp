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
        function fun(thisurl){
            window.open(thisurl, "页面标题","width=470,height=150,scrollbars=yes,resize=no");
        }
    </script>
</head>
<body>
<form action="" method="post" name="myform">
    网址:<select name="url" onchange="fun(this.value)">
    <option value="script_eventform_01.jsp">event-01</option>
    <option value="script_eventform_02.jsp">event-02</option>
    <option value="script_eventform_03.jsp">event-03</option>
</select>
</form>


</body>
</html>








































