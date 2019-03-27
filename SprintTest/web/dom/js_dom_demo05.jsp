<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript">
       function addrow() {
           var tab = document.getElementById("mytab");
           var id = document.getElementById("id").value;
           var name = document.getElementById("name").value;
           var tr = document.createElement("tr");
           var tbody = document.createElement("tbody");
           var td_id = document.createElement("td");
           var td_name = document.createElement("td");
           td_id.appendChild(document.createTextNode(id));
           td_name.appendChild(document.createTextNode(name));
           tr.appendChild(td_id);
           tr.appendChild(td_name);
           tbody.appendChild(tr);
           tab.append(tbody);
       }
    </script>
</head>
<body>
新的编号:<input type="text" id="id">
新的姓名:<input type="text" id="name">
<input type="button" value="增加" onclick="addrow()">
<table id="mytab" border="1">
    <tr>
        <td>编号</td>
        <td>姓名</td>
    </tr>
</table>

</body>
</html>
