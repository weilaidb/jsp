<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5 0005
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>request 平方根</title>
</head>
<body bgcolor="#00ffff">
<font size="3">
    <form action="" method="post" name="form">
        <input type="text" name="girl">
        <input type="submit" value="Enter" name="submit">
    </form>

    <%
        String textContent = request.getParameter("girl");
        double number = 0,r = 0;
        if(null == textContent)
        {
            textContent = "";
        }

        try{
            number = Double.parseDouble(textContent);
            if(number >= 0 ){
                r = Math.sqrt(number);
                out.print("<br>" + number + "的平方根:");
                out.print("<br>" + r);

            }
            else
            {
                out.print("<br>" + "请输入一个正数");
            }
        }
        catch (NumberFormatException e){
            out.print("<br>" + "请输入数字字符");
        }
        catch (Exception e){
            out.print("<br>" + "错误信息：" + e.toString());
        }
    %>
</font>

</body>
</html>
