<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/2 0002
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"   pageEncoding="UTF-8" %>
<html>
<head>
    <title>People</title>
</head>
<body bgcolor="yellow">
<font size="3">
    <%!
        int count;
        StringBuffer personList;
        public void judge(){
            if(0 == count)
                personList = new StringBuffer();
        }
        public void addPerson(String p){
            if(0 == count)
                personList.append(p);
            else
                personList.append("," + p);
            count++;
        }
    %>

    <%
        String name = request.getParameter("name");
        byte bb[] = name.getBytes("iso-8859-1");
//        byte bb[] = name.getBytes("UTF-8");
//        name = new String(bb);
        if(0 == name.length() || name.length() > 10){
    %>

    <jsp:forward page="inputName.jsp"></jsp:forward>
    <%
        }
        judge();
        addPerson(name);
    %>

    <br>目前共有<%=count%>人浏览了该页面，他们的名字是:
    <br><%=personList%>
</font>

</body>
</html>
