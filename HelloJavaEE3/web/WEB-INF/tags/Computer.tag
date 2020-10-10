<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="numberA" required="true" %>
<%@ attribute name="numberB" required="true" %>
<%@ attribute name="operator" required="true" %>
<%@ variable name-given="result" scope="AT_END" %>
<%
    try{
        double a = Double.parseDouble(numberA);
        double b = Double.parseDouble(numberB);
        double r = 0;
        if(operator.equals("+"))
            r = a + b;
        else if (operator.equals("-"))
            r = a - b;
        else if(operator.equals("*"))
            r = a * b;
        else if (operator.equals("/"))
            r = a/b;
        jspContext.setAttribute("result", String.valueOf(r));
    }
    catch (Exception e){
        jspContext.setAttribute("result", "发生异常:" + e);
    }
%>