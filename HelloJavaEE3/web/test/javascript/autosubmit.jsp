<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/11
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <script type="text/javascript">
        function sumRes(){
            var n=$("endtime").val();
            var c=$("currentTime").val();
            if(n==c){
                $("submitForm").submit();
            }

        }

    </script>

</head>

<body>

<%
    Object e=request.getParameter("endTime");
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    long endtime=12;
    if(null == e)
    {
        endtime=1243;
    }
    else
    {
        endtime=Long.valueOf(String.valueOf(e));
    }

    Date d=new Date();
    long currentTime=d.getTime();
%>
<form action="fangfa" method = "post" id = "submitForm" >
    <table>
        <tr>
            <td>

                <input type="hidden" value="${b}" name="b">
            </td>
        </tr>
    </table>
</form>
<script text="javascript">
    sumRes();
</script>
</body>

</html>

