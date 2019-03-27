<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript">
        function setFun() {
            var id = new Array(1,2,3,4,5,);
            var value = new Array("北京","南京","世界","世界","世界");
            var select = document.getElementById("area");
            select.length = 1;
            select.options[0].selected = true;
            for(var x = 0; x < id.length; x++)
            {
                var option = document.createElement("option");
                option.setAttribute("value", id[x]);
                option.appendChild(document.createTextNode(value[x]));
                select.appendChild(option);
            }

            var seq = 1;
            if(select.options.length > seq)
            {
                select.options[seq].selected = true;
            }

        }
    </script>
</head>
<body onload="setFun()">
<form action="" method="post">
    <select name="diqu" id="area">
        <option value="0">没有地区</option>
    </select>
</form>
</body>
</html>
