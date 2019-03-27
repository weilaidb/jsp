<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public static final String INFO = "www.fsdfdsf.cn";
%>
<%!
    public int add(int x, int y) {
        return x + y;
    }
%>

<%!
    class Person{
        private String name;
        private int age;
        public Person(String name, int age){
            this.name = name;
            this.age = age;
        }

        public String toString(){
            return "name = " + this.name
                    +";age = " + this.age;
        }
    }
%>


<%
    out.println("<h3>INFO = " + INFO + "</h3>");
    out.println("<h3>3+5 = " + add(3,5) + "</h3>");
    out.println("<h3>" + new Person("zhangsan",33) + "</h3>");
%>

</body>
</html>
