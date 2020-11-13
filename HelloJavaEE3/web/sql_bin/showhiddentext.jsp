<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/1
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        h3{text-align:center;}
        #content{text-indent:2em;}
    </style>
</head>
<body>
<h3>习近平汇聚“中国力量”</h3>
<span id="content">
       合抱之木，生于毫末；九层之台，起于垒土。实现中华民族伟大复兴是一个长期而艰巨的过程，需要凝聚磅礴之力，
       才能实现质的飞跃。党的十八大以来，以习近平同志为核心的党中央高瞻远瞩、统揽全局，为实现“两个一百年”奋斗目标、
       实现中华民族伟大复兴的中国梦汇聚了强大的“中国力量”。2013年3月17日，北京，第十二届全国人民代表大会第一次会议
       闭幕会上，刚刚当选国家主席的习近平向全世界系统阐述“中国梦”，并道出了这句凝心聚力的话语。他深情地说，“中国梦是民族的梦，
       也是每个中国人的梦。只要我们紧密团结，万众一心，为实现共同梦想而奋斗，实现梦想的力量就无比强大。”“只有把人生理想融入国
       家和民族的事业中，才能最终成就一番事业。”2013年5月2日，习近平在给北京大学考古文博学院2009级本科团支部全体同学的回信中
       写道。寥寥28个字，字字千钧——将个人梦融入家国梦，实现个人梦的空间会更大、机会会更多、人生会更精彩。无数个人梦叠加得越高，
       距离家国梦的实现也就越近。习近平不厌其烦，一次又一次殷殷嘱咐，要“把个人梦与中国梦紧密联系在一起”。对青年一代，他寄予厚望：
       青年一代有理想、有担当，国家就有前途，民族就有希望，实现我们的发展目标就有源源不断的强大力量；对工人阶级，他要求大家立足本职、
       胸怀全局，自觉把人生理想、家庭幸福融入国家富强、民族复兴的伟业之中，“始终以国家主人翁姿态为坚持和发展中国特色社会主义作出贡献”；
       对国家机关工作人员，他说要克己奉公，廉政勤政，关心人民疾苦，为人民办实事；对中国人民解放军，他不止一次发起气冲云霄的动员令：汇聚
       起强国强军的磅礴力量，为共同实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦而不懈奋斗。
   </span>
<a href=""  id="btn"><<<收缩</a>
<%--<a href=""  id="btn">>>>展开</a>--%>
<script type="text/javascript">
    //获取button按钮
    var btn=document.getElementById('btn');
    //获取p
    var content=document.getElementById('content');
    //获取p中的内容
    var str=content.innerHTML;
    //定义一个变量，表示当前的状态（收缩、展开）
    var onOff=true;// true表示展开
    console.log("onOff:" + onOff)
    btn.onclick=function(){
        console.log("onclick onOff:" + onOff)
        if(onOff) {
            content.innerHTML = str.substr(0,50)+"......";
            btn.innerHTML='>>>展开'
        } else {
            //说明当前状态是收缩的，需要展开
            content.innerHTML = str
            btn.innerHTML = '<<<收缩';
        }
        onOff=!onOff; //每点击一次，改变一次展开、收缩状态
        return false;  //阻止a标签的默认事件
    }

    window.onload=function(){
        console.log("onclick onOff:" + onOff)
        if(onOff) {
            content.innerHTML = str.substr(0,50)+"......";
            btn.innerHTML='>>>展开'
        } else {
            //说明当前状态是收缩的，需要展开
            content.innerHTML = str
            btn.innerHTML = '<<<收缩';
        }
        onOff=!onOff; //每点击一次，改变一次展开、收缩状态
        return false;  //阻止a标签的默认事件
    }
</script>
</body>
</html>