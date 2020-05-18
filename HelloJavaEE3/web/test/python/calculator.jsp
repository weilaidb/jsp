<%@ page import="python.PythonCommand" %>
<%@ page import="weilaidb.sql.JspAdapter" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/18
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=JspAdapter.getJspTitleByKey("calc")%></title>
</head>
<body>

<%--<%=PythonCommand.calcResult("1+1")%>--%>
<%--<%=PythonCommand.calcResult("1+2")%>--%>
<%--<%=PythonCommand.calcResult("hex(1234)")%>--%>
<%--<%=PythonCommand.calcResult("hex(1234)")%>--%>
<%--<%=PythonCommand.calcResult("hex(1234)")%>--%>
<%--<%=PythonCommand.calcResult("hex(1234)")%>--%>
<%--<%=PythonCommand.calcResult("hex(1234)")%>--%>


<form name="calc" method="post"   >
    <input type="text" name="showtext" value="输入计算式" class="text3"/>
    <input type="text" name="express" value="" class="text3"/>
    <input type="button" name="calc" value="计算" class="button"/>
</form>

</body>
</html>
