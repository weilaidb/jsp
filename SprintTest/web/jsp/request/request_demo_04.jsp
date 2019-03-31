<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%//接收表单提交的参数
    request.setCharacterEncoding("UTF-8");
%>
<center>
    <table border="1">
        <tr>
            <td>参数名称</td>
            <td>参数内容</td>
        </tr>
        <%
            Enumeration enu = request.getParameterNames();
            while(enu.hasMoreElements()) {
                String paraName = (String)enu.nextElement();
        %>
        <tr>
            <td><%=paraName%></td>
            <td>
                <%
                    if(paraName.startsWith("**")) {
                        String paraValue[] = request.getParameterValues(paraName);
                        for(int x = 0; x < paraValue.length; x++) {
                %>
                            <%=paraValue[x]%>、
                <%
                        }
                    }else{
                        String paraValue = request.getParameter(paraName);
                %>
                    <%=paraValue%>
                <%
                    }
                %>
            </td>
        </tr>

<%
    }
%>

    </table>
</center>

</body>
</html>
