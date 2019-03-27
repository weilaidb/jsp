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
       var count =3;
       function addrow() {
           var table = document.getElementById("mytable");
           var tr = table.insertRow();
           var td1 = tr.insertCell();
           var td2 = tr.insertCell();
           var td3 = tr.insertCell();
           td1.innerHTML = "MLDN XLL" + count;
           td2.innerHTML = "李李郴李李李要" + count;
           td3.innerHTML = "<input type='button' value='-' onClick='deleterow(this);'>";
           count++;
       }
       function deleterow(btn) {
           var tr = btn.parentNode.parentNode;
           var table = document.getElementById("mytable");
           table.deleteRow(tr.rowIndex);

       }
    </script>
</head>
<body onload="setFun()">
<input type="button" value="+" onclick="addrow();">
<table id="mytable" border="1">
    <tr>
        <td>MLDFDF fdsfd</td>
        <td>李李椰树阿附-1</td>
        <td><input type="button" value="-" onclick="deleterow(this);"> </td>
    </tr>

    <tr>
        <td>置顶地 地厅 2</td>
        <td>哈哈人</td>
        <td><input type="button" value="-" onclick="deleterow(this);"> </td>
    </tr>
</table>
</body>
</html>
