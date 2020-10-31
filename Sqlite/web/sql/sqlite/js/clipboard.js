function ClearTextArea() {
    document.getElementById("id_insertdb").value = "";
}

function CopyToClipBoard(txt) {
    var clipBoardContent = txt;
    window.top.clipboardData.setData("Text", clipBoardContent);
}
function ClipBoard2TextArea() {
    var clipboardContent = "abcfd";
    // var clipboardContent = window.top.clipboardData.getData("text");
    console.log(clipboardContent);
    document.getElementById("id_insertdb").value = clipboardContent;
}

//覆盖浏览器粘贴事件
document.addEventListener('paste', function (e) {
    var clipboardData = e.clipboardData;
    // console.log("paste event!!")
    if (!(clipboardData && clipboardData.items)) {//是否有粘贴内容
        return;
    }
    for (var i = 0, len = clipboardData.items.length; i < len; i++) {
        var item = clipboardData.items[i];
        if (item.kind === "string" && item.type == "text/plain") {
            item.getAsString(function (str) {
                // str 是获取到的字符串,创建文本框
                //处理粘贴的文字内容
            })
        } else if (item.kind === "file") {//file 一般是各种截图base64数据
            var pasteFile = item.getAsFile();
            // pasteFile就是获取到的文件
            var reader = new FileReader();
            reader.onload = function (event) {
                var base64Img = event.target.result;
            }; // data url
            reader.readAsDataURL(pasteFile);
        }
        var copy_content = e.clipboardData.getData('text/plain');

    }
})

document.addEventListener("paste", function (e) {
    // console.log(e.clipboardData.getData("text"));
    document.getElementById("id_insertdb").value = e.clipboardData.getData("text");
});

document.onkeydown = function (e) {
    if (e.ctrlKey && e.keyCode == 67) {//ctrl+C
        // console.log("ctrl + C");
        function handler(event) {
            // console.log("ctrl + C22");
            // var cliptext = event.clipboardData.getData('text/plain');
            var cliptext = event.clipboardData.getData('text/plain');
            // console.log(cliptext);
            // console.log("afdf");
            // console.log(event.clipboardData.getData('text'));
            // event.clipboardData.setData('text/plain', "自定义复制内容");
            document.removeEventListener('copy', handler, true);
            event.preventDefault();
        }

        document.addEventListener('copy', handler, true);
        // document.execCommand('copy');
    }
}

document.onmousedown = function (ev) {
    // console.log(ev);
    // document.getElementById("id_insertdb").value = ev.toString();

}
