<%@ page import="org.omg.CORBA.INTERNAL" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>result</title>
</head>
<body>
<%
    String str = request.getParameter("boy");
    if(str.length() == 0){
        response.sendRedirect("inputGuess.jsp");
    }
    int guessNumber = -1;

    try{
        guessNumber = Integer.parseInt(str);
        Integer integer = (Integer)session.getAttribute("save");
        int realnumber = integer.intValue();
        if (guessNumber == realnumber) {
            int n  = ((Integer)session.getAttribute("count")).intValue();
            n = n + 1;
            session.setAttribute("count", new Integer(n));
            response.sendRedirect("success.jsp");
        } else if (guessNumber > realnumber) {
            int n = ((Integer)session.getAttribute("count")).intValue();
            n = n + 1;
            session.setAttribute("count", new Integer(n));
            response.sendRedirect("large.jsp");
        } else if (guessNumber < realnumber) {
            int n = ((Integer)session.getAttribute("count")).intValue();
            n = n + 1;
            session.setAttribute("count", new Integer(n));
            response.sendRedirect("small.jsp");
        }
    }
    catch (Exception e){
        response.sendRedirect("inputGuess.jsp");
//        out.print("<br>" + "错误信息：" + e.toString());
    }
%>

</body>
</html>
