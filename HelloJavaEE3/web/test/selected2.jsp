<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/9
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>

    getTitleData=function(){
        var searchtitle = $("#searchtitle").val();
        var searchtitle = $.trim(searchtitle);

        window.location = 'history.php?id=' + searchtitle;
        document.cookie = "id=" + searchtitle;    //将select选中的value写入cookie中
    };

    selectIndex=function(){
        var id = 0;
        var coosStr = document.cookie;    //获取cookie中的数据
        var coos=coosStr.split("; ");     //多个值之间用; 分隔
        for(var i=0;i<coos.length;i++){   //获取select写入的id
            var coo=coos[i].split("=");
            if("id"==coo[0]){
                id=coo[1];
            }
        }
        var stitle=document.getElementById("searchtitle");
        if(stitle == 0){
            stitle.selectedIndex = 0;
        }
        else{    //如果从cookie中获取的id和select中的一致则设为默认状态
            var len = stitle.options.length;
            for(var i=0;i<len;i++){
                if(stitle.options[i].value == id){
                    stitle.selectedIndex=i;
                    break;
                }
            }
        }

    }

</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="history.php" method="post">
    <select style='width:10%;height:20%;' class='form-control' name='searchtitle' onchange='getTitleData()' type='text' id='searchtitle'>
        <option value='2'>运营32位测试数据</option>
        <option value='3'>运营64位测试数据</option>
        <option value='4'>主干32位测试数据</option>
        <option value='5'>集成32位测试数据</option>
        <option value='6'>集成64位测试数据</option>
        <option value='8'>主干64位测试数据</option>
    </select><br>
</form>
</body>
</html>
