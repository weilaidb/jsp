<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/25
  Time: 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>script demo 01</title>
    <script language="JavaScript">
        function show() {
            var name = document.myform.name.value;
            alert("姓名：" + name);
            var sex;
            if(document.myform.sex[0].checked){
                sex = document.myform.sex[0].value;
            }
            else
            {
                sex = document.myform.sex[1].value;
            }
            alert("性别：" + sex);
            var inst="";
            for(i = 0; i < document.myform.inst.length; i++)
            {
                if(document.myform.inst[i].checked){
                    inst += document.myform.inst[i].value + "、";
                }
            }
            alert("兴趣:" + inst);
        }
    </script>
</head>
<body >
<form action="" method="post" name="myform">
    姓名：<input type="text" name="name"><br>
    性别：<input type="radio" name="sex" value="男" checked>男
            <input type="radio" name="sex" value="女">女
    兴趣：<input type="checkbox" name="inst" value="唱歌">唱歌
        <input type="checkbox" name="inst" value="游泳">游泳
        <input type="checkbox" name="inst" value="跳舞">跳舞
        <input type="checkbox" name="inst" value="编程" checked>编程
        <input type="checkbox" name="inst" value="上网">上网
    <input type="button" value="显示" onclick="show()">
</form>

</body>
</html>








































