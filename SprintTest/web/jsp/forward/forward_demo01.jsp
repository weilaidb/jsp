<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%
    String username="LXHHAHA";
%>

<jsp:forward page="forward_demo02.jsp">
    <jsp:param name="name" value="<%=username%>"/>
    <jsp:param name="info" value="www.csdn.net"/>
</jsp:forward>
