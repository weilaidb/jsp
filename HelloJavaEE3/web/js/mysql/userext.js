
// 复制的方法
function copyText(text, callback) { // text: 要复制的内容， callback: 回调
    var tag = document.createElement('input');
    tag.setAttribute('id', 'cp_hgz_input');
    tag.value = text;
    // document.getElementsByTagName('body')[0].appendChild(tag);
    document.getElementsByTagName('body')[0].append(tag);
    document.getElementById('cp_hgz_input').select();
    document.execCommand('copy');
    // document.getElementById('cp_hgz_input').remove();
    if (callback) {
        callback(text)
    }
}

// // 点击按钮调用复制
// document.getElementById('btncopy').onclick = function () {
//     var texts = document.getElementById('ipt').value
//     copyText(texts, function () {
//         alert('复制成功 \n复制内容内容 \n' + texts)
//     })
// }

// 点击按钮调用复制
document.getElementById('btncopy').onclick = function () {
    var texts = document.getElementById('ipt').select();
    document.execCommand('copy');
    // copyText(texts, function () {
    //     alert('复制成功 \n复制内容内容 \n' + texts)
    // })
}



// 点击按钮调用粘贴
document.getElementById('btnpaste').onclick = function () {
    var texts = document.getElementById('ipt').select();
    // document.getElementById('ipt').value = "";
    // document.execCommand('delete');
    ipt.focus();
    document.execCommand('insertText');
    // copyText(texts, function () {
    //     alert('复制成功 \n复制内容内容 \n' + texts)
    // })
}


