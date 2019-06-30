<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/30
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    var blob = new Blob(["Hello World!Helloo World!"],{type:"text/plain;charset=utf-8"});  // type:可以设置别的文件类型
    console.log(blob);
</script>
<script>
    function sliceBlob(blob, start, end, type) {
        type = type || blob.type;
        if (blob.mozSlice) {
            return blob.mozSlice(start, end, type);
        } else if (blob.webkitSlice) {
            return blob.webkitSlice(start, end, type);
        } else {
            throw new Error("This doesn't work!");
        }
    }
</script>
<script>
    // demo 程序将粘贴事件绑定到 document 上
    document.addEventListener("paste", function (e) {
        var cbd = e.clipboardData;
        var ua = window.navigator.userAgent;

        // 如果是 Safari 直接 return
        if ( !(e.clipboardData && e.clipboardData.items) ) {
            console.log("clip null")
            return;
        }
        // Mac平台下Chrome49版本以下 复制Finder中的文件的Bug Hack掉

        if(cbd.items && cbd.items.length === 2 && cbd.items[0].kind === "string" && cbd.items[1].kind === "file" &&
            cbd.types && cbd.types.length === 2 && cbd.types[0] === "text/plain" && cbd.types[1] === "Files" &&
            ua.match(/Macintosh/i) && Number(ua.match(/Chrome\/(\d{2})/i)[1]) < 49){
            console.log("clip mac")
            return;
        }

        for(var i = 0; i < cbd.items.length; i++) {
            var item = cbd.items[i];
            if(item.kind == "file"){
                var blob = item.getAsFile();
                if (blob.size === 0) {
                    return;
                }
                console.log("file");
                // blob 就是从剪切板获得的文件 可以进行上传或其他操作
            }
            if(item.kind == "text/plain"){
                var blob = item.getAsString();
                if (blob.size === 0) {
                    return;
                }
                console.log("plain");
                // blob 就是从剪切板获得的文件 可以进行上传或其他操作
            }
            if(item.kind == "text/html"){
                var blob = item.getAsString();
                if (blob.size === 0) {
                    return;
                }
                console.log("html");
                // blob 就是从剪切板获得的文件 可以进行上传或其他操作
            }

        }
    }, false);

</script>

<%--<script>--%>
    <%--pasteEle.addEventListener("paste", function (e){--%>
        <%--if ( !(e.clipboardData && e.clipboardData.items) ) {--%>
            <%--return ;--%>
        <%--}--%>

        <%--for (var i = 0, len = e.clipboardData.items.length; i < len; i++) {--%>
            <%--var item = e.clipboardData.items[i];--%>

            <%--if (item.kind === "string") {--%>
                <%--item.getAsString(function (str) {--%>
                    <%--// str 是获取到的字符串--%>
                <%--})--%>
            <%--} else if (item.kind === "file") {--%>
                <%--var pasteFile = item.getAsFile();--%>
                <%--// pasteFile就是获取到的文件--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>
    <%----%>
<%--</script>--%>


<body>


</body>
</html>
