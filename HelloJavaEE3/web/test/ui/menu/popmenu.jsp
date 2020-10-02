<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/27 0027
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8">
    <title>子菜单</title>
    <!--CDN上引入bootstrap样式和插件，可以不使用，自己写一样有效果-->
    <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <style>
    #subMenu {
    display: none;
    position: fixed;
    top: 55px;
    left: 10px;
    }
    </style>
    <script>
    function showSubMenu() {
    var m = document.getElementById("subMenu");
    m.style.display = "block";
    }

    function hiddenSubMenu() {
    var m = document.getElementById("subMenu");
    m.style.display = "none";
    }
    </script>


    <link rel="stylesheet" href="http://www.people.com.cn/img/2016people/default.css" type="text/css" />
    <style type="text/css">
    header .sub_nav_bottom .sub_nav_list{ width:790px;}
    header .sub_nav_bottom .sub_nav_list li{ width:790px;}
    header .sub_nav_bottom .sub_nav_list li.one a{margin:0; padding:0 23px 0 23px;}
    header .sub_nav_bottom .sub_nav_list li.two a{margin:0; padding:0 16px 0 16px;}
    header .sub_nav_bottom .sub_nav_list li.thr a{margin:0; padding:0 20px 0 20px;}
    nav .nav_custom .navstatus { top:20px;}
    nav .nav_custom { height:245px; padding-top:50px;}
    nav .w1000 span{display:inline-block}
    nav .nav_custom{height:115px;padding-top:0;padding-left:25px;width:975px;left:0}
    nav .nav_custom em{width:28px;margin:8px 14px 2px 9pt;background:none}
    nav .nav_custom em a{color:#333;margin:0}
    .cont_a .main .main_icon2{background:url(/img/2016people/images/wangluo.jpg) no-repeat;}
    .cont_a .main .main_icon2 a{ display:block; width:62px; height:18px;}
    span.icon_dlfj {display:inline-block;width:107px;height:30px;background:url(/img/2016people/images/dlfjdwn.jpg) no-repeat;vertical-align:middle;margin-top:-3px;margin-right:3px;}
    span.icon_dlfj a{display:inline-block;width:107px;height:30px;}
    span.icon_laixin {display:inline-block;width:70px;height:30px;background:url(/img/2016people/images/tubiao/aq_laixin.jpg) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_laixin a{display:inline-block;width:70px;height:30px;}
    span.icon_wanglian{display:inline-block;width:90px;height:25px;background:url(/img/2016people/images/tubiao/aq_wl.png) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_wanglian a{display:inline-block;width:90px;height:25px;}
    .cont_a .main .main_iconRed{background:url(/img/2016people/images/toutiaoRed.png) no-repeat;}
    .cont_a .main .main_icon1Red{background:url(/img/2016people/images/yaolunRed.png) no-repeat;}
    span.icon_xczjc {display:inline-block;width:90px;height:24px;background:url(/img/2016people/images/xczjc_a.jpg) no-repeat;vertical-align:middle;margin-top:-3px;margin-right:3px;}
    span.icon_xczjc a{display:inline-block;width:90px;height:24px;}
    span.icon_fd {display:inline-block;width:83px;height:38px;background:url(/img/2016people/images/tubiao/fendou.png) no-repeat;vertical-align:middle;margin-right:3px; background-size:contain;}
    span.icon_70wen {display:inline-block;width:83px;height:28px;background:url(/img/2016people/images/tubiao/70wen.png) no-repeat;vertical-align:middle;margin-right:3px; background-size:contain;}
    span.icon_fd a{display:inline-block;width:83px;height:38px;}
    .main span.tb_gaige{background:url(/img/2016people/images/tubiao/gaige.png) no-repeat; background-size:contain; width:63px; height:24px; display:block; float:left;}
    .main span.tb_gaige5{background:url(/img/2016people/images/tubiao/gaige51.png) no-repeat; background-size:contain; width:155px; height:24px; display:block; float:left;}
    .main span.tb_gaige5 a{ display:block; width:100%; height:100%;}
    span.tb_bwcx {display:inline-block;width:77px;height:36px;background:url(/img/2016people/images/tubiao/tb_bwcx.png) no-repeat;vertical-align:middle;background-size:contain;}
    span.icon_zhiji{display:inline-block;width:83px;height:28px;background:url(/img/2019peopleindex/images/tubiao/tb_zjfin.png) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_zhiji a{display:inline-block;width:83px;height:28px;}
    span.icon_wangping{display:inline-block;width:83px;height:28px;background:url(/img/2019peopleindex/images/tubiao/tb_wpfin.png) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_wangping a{display:inline-block;width:83px;height:28px;}
    span.icon_zhizhi{display:inline-block;width:64px;height:30px;background:url(/img/2019peopleindex/images/tubiao/zzzz1.png) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_zhizhi a{display:inline-block;width:64px;height:30px;}
    span.icon_dflh{display:inline-block;width:98px;height:26px;background:url(/img/2019peopleindex/images/tubiao/dflh.png) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_dflh a{display:inline-block;width:98px;height:26px;}
    span.icon_yqgd{display:inline-block;width:85px;height:30px;background:url(/img/2019peopleindex/images/tubiao/yqgd.png) no-repeat;vertical-align:middle;margin-right:3px;}
    span.icon_yqgd a{display:inline-block;width:85px;height:30px;}
    </style>
    <script type="text/javascript" src='http://www.people.com.cn/img/2016people/jslibs/jquery-1.7.1.min.js'></script>
    <script type="text/javascript" src='http://www.people.com.cn/img/2016people/jslibs/jquery.jcarousellite-1.0.1.min.js'></script>
    <script type="text/javascript" src='http://www.people.com.cn/img/2016people/jslibs/peopleindex.js' charset='utf-8'></script>
    <script src="http://www.people.com.cn/img/2019peopleindex/js/slide.js" charset='utf-8'></script>
    <script>
    var mainSlide = null
    function playVideo (id) {
    var videoBox = document.querySelector('.tvplayshow')
    // 显示
    videoBox.style.display = 'block'
    // 停止自动轮播
    if (mainSlide) mainSlide.stopAutoPlay()
    mainSlide.isBusy = true
    showPlayerBox({
    id: id,
    width: 655,
    height: 415,
    // 播放视频的盒子
    box: videoBox.querySelector('.video-play')
    });
    }
    function stopVideoPlay () {
    var videoBox = document.querySelector('.tvplayshow')
    // 显示
    videoBox.style.display = 'none'
    videoBox.querySelector('.video-play').innerHTML = ''
    mainSlide.isBusy = false
    // 开启自动轮播
    if (mainSlide) mainSlide.startAutoPlay(3000)
    }
    $(document).ready(function() {
    $('.cont_h').custom({
    defaultd:'19,4,3,5,8,12,32,14,11,1,2,6,7,9,10,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,33,34'
    });
    // 加载轮播图
    mainSlide = new Slide($("#focus_list")[0], 'ul', 'li', {
    // 自动播放间隔
    autoPlay:4000,
    // 切换下一个轮播图的class或ID
    nextEl: ".focus_right_b",
    // 切换上一个轮播图的class或ID
    prevEl: ".focus_left_b",
    // 数字分页器
    numberPaginationEL: ".focusn",
    })
    if($(".banner5").height() > 0){
    $('.cont_h').css("height","1400px");
    }
    else{
    $('.cont_h').css("height","1280px");
    }
    });
    </script>
    <script type="text/javascript" language="javascript">
    <!--
    (function() {
    if (!
    /*@cc_on!@*/
    0) return;
    var e = "abbr, article, aside, audio, canvas, datalist, details, dialog, eventsource, figure, footer, header, hgroup, mark, menu, meter, nav, output, progress, section, time, video".split(', ');
    var i= e.length;
    while (i--){
    document.createElement(e[i])
    }
    })()
    -->
    </script>

    <style type="text/css">
    .bannerTop{margin:5px auto 25px;}

    </style>
    <style type="text/css">
    /*20171026*/
    .newsTop{width:1000px;height:90px;margin:10px auto; height:auto;}
    /*20171103*/
    .cont_a .main{ width:330px; margin-left:0px; padding-left:15px;}
    .cont_a .main h2{ width:315px; margin-left:15px;}
    .cont_a .main ul {
    display: block;
    width: 315px;
    margin-left: 15px;
    }
    .news_shijiuda_box{
    background: #fffbee;
    padding-bottom: 5px;
    }
    .news_shijiuda_box li{
    font-size: 14px;
    font-family: SimSun;
    height: 24px;
    line-height: 31px;
    padding: 0px 0px 14px;
    overflow: hidden;
    padding-bottom:6px;
    padding-left: 15px;
    _padding-left: 0px;
    *padding-left: 0px;
    }
    .news_shijiuda_box li.tit{
    padding-left: 0px;
    letter-spacing: -1px;
    }
    .news_shijiuda_box li a:link,.news_shijiuda_box li a:hover,.news_shijiuda_box li a:visited{
    color:#b01812;
    }
    .news_shijiuda_box a.sjdlink{
    display:inline-block;
    width:116px;
    height:32px;
    background:url(/img/2016people/images/20171012/linghang3.jpg) no-repeat top left;
    float:left;
    }
    .news_shijiuda_con ul.list14 {
    padding-bottom: 5px;
    }
    .news_shijiuda_con ul.list14 li {
    padding-bottom: 6px;
    }
    /*20180117*/
    .cont_language .city_list a{
    margin:0 5px 0 6px;
    }
    /*20180720*/
    #rmw_hotnew li,#rmw_like li,#rmw_zhuanti li{
    padding: 0px 0 14px 0;
    height: 19px;
    overflow: hidden;
    line-height: 31px;
    }
    .cont_f div.fr div.title {
    margin-top: 0px;
    padding: 0 0 0px 0;
    }
    #rmw_hotnew,#rmw_like {
    height: 165px;
    overflow: hidden;
    }
    /*20180720*/
    nav .nav_custom {
    height: 95px;
    padding-top: 20px;
    padding-left: 25px;
    width: 975px;
    }
    nav .nav_custom em{
    margin: 7px 0px 2px 0pt;
    padding: 3px 10px;
    }
    /*20180725*/
    .cont_a .main .djbl_icon {
    display: inline-block;
    width: 130px;
    height: 38px;
    background: url(/img/2016people/images/djIcon1.jpg) no-repeat;
    vertical-align: middle;
    margin-right: 3px;
    }
    .cont_a .main .djbl_icon a {
    display: inline-block;
    width: 130px;
    height: 38px;
    }
    /*20180815*/
    .cont_a .main .ydyl5_icon {
    display: inline-block;
    width: 116px;
    height: 34px;
    background: url(/img/2016people/images/ydyl-Icon.jpg) no-repeat;
    vertical-align: middle;
    margin-right: 3px;
    }
    .cont_a .main .ydyl5_icon a {
    display: inline-block;
    width: 116px;
    height: 34px;
    }
    /*updata:20180927*/
    nav .nav_custom {
    height: 105px;
    padding-top: 15px;
    padding-left: 25px;
    width: 975px;
    }
    nav .nav_custom em{
    margin: 5px 0px 2px 0pt;
    padding: 3px 8px;
    }
    /*updata:20181029*/
    #rmw_hotnew,#rmw_like {
    height: 150px;
    overflow: hidden;
    }
    #rmw_hotnew li,#rmw_like li,#rmw_zhuanti li{
    padding: 0px 0 11px 0;
    height: 19px;
    overflow: hidden;
    line-height: 31px;
    }
    /*updata:20190110 in design*/
    .box_nav_list{
    height:390px;
    }
    /*updata:20190303 in design*/
    .cont_d .news_left .ad_left{
    background:url(/img/2016people/images/2019lh/banner_bg1.jpg) no-repeat;
    background-size:contain;
    }
    /*updata:20190327 in design*/
    .aiguo{
    display: inline-block;
    width: 106px;
    height: 25px;
    background: url(/img/2016people/images/aiguo.jpg) no-repeat;
    vertical-align: middle;
    margin-right: 3px;
    }
    /*updata:20190613 in codeThree*/
    span.icon_cz{display:inline-block;width:83px;height:38px;background:url(/img/2016people/images/tubiao/changzheng.png) no-repeat;vertical-align:middle;margin-right:3px; background-size:contain;}
    span.icon_cz a{display:inline-block;width:83px;height:38px;}

    </style>

    </head>

    <body>
    <nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
    <a class="navbar-brand" href="#" onmouseover="showSubMenu()" onmouseout="hiddenSubMenu()">省市</a>
    </div>
    <div class="navbar-header">
    <a class="navbar-brand" href="#" data-toggle="dropdown">插件子菜单</a>
    <ul class="dropdown-menu">
    <li><a href="#">江苏</a>
    </li>
    <li class="divider"></li>
    <li><a href="#">山西</a>
    </li>
    </ul>
    </div>
    </nav>

    <div id="subMenu" class="panel panel-default">
    <div class="panel-body">
    <li>河北</li>
    <li>河南</li>
    <li>山东</li>
    </div>
    </div>

    <style type="text/css" id="ipadCSS"></style>
    <script type="text/javascript">
    ~function(){
    var isTouchDevice = 'ontouchstart' in window;
    if(isTouchDevice){
    }
    }();
    </script>

    <style>
    body{font-family:"Microsoft YaHei","微软雅黑","SimSun","宋体";}

    .first-nav a{padding-left:26px; padding-right:18px;}
    .first-nav a.active{color:#990000;}

    .blk12{width:345px;}
    .blk122 a{font-size: 15px;color: #333333;line-height: 15px;margin-bottom: 22px}
    .blk122 a:hover{color:#62729a;}
    .blk112{margin-top:14px;}
    .scroll-pic1 a, .scroll-pic1 img{width:318px;}
    .scroll-pic1 img{border:1px #ccc solid;}
    .scroll-pic1 span{width:318px;}
    .blk112_c{margin-top:24px;}
    .blk112_c .img-news{margin-top:16px; margin-bottom:24px;}
    .blk112_c .img{width:120px;}
    .blk112_c p{margin-right:16px;}
    .blk2_c a span {display: block; height: 19px; width: 160px; overflow: hidden;}

    .ul01 li{padding-left:15px;}

    #preload_bookmark,
    #preload_bookmark #sprite{width:0;height:0;position:absolute;left:-9999px;background:url("//i2.sinaimg.cn/dy/sinatag/addfav_pop_bg.png") no-repeat 0 0;}
    #preload_bookmark #sprite{background:url("//i1.sinaimg.cn/dy/sinatag/btns_addfav_spirite.png") no-repeat 0 0;}

    .blk6-tab span{width:134px;}
    #subShowTab1 span{width:142px;}

    </style>


    <!-- first-nav -->
    <div class="first-nav" data-sudaclick="first-nav">
    <div class="wrap">
    <a href="http://news.sina.com.cn/">首页</a>
    <a href="http://news.sina.com.cn/china/">国内</a>
    <a href="http://news.sina.com.cn/world/" class="active">国际</a>
    <!--<a href="http://news.sina.com.cn/society/">社会</a>-->
    <a href="http://mil.news.sina.com.cn/">军事</a>
    <a href="http://piyao.sina.cn">辟谣</a>
    <a href="http://news.sina.cn/zt_d/sz2019">知事</a>
    <a href="http://video.sina.com.cn/news/">视频</a>
    <a href="http://cul.news.sina.com.cn/">文化</a>
    <!--<a href="http://news.sina.com.cn/opinion/">评论</a>-->
    <a href="http://photo.sina.com.cn/">图片</a>
    <a href="http://news.sina.com.cn/vr/">VR视频</a>
    </div>
    </div>
    <!-- first-nav end -->

    <span class="defaultmenu">旗下网站
    <ul>
    <li><a href="https://visual.people.cn/" target="_blank">人民视觉</a></li>
    <li><a href="http://www.huanqiu.com/" target="_blank">环球网</a></li>
    <li><a href="http://www.peopleyuqing.com/" target="_blank">人民在线</a></li>
    <li><a href="http://www.haiwainet.cn/" target="_blank">海外网</a></li>
    <li><a href="http://mooc.people.cn/" target="_blank">公开课</a></li>
    <li><a href="http://jinbao.people.cn/" target="_blank">金报电子</a></li>
    <li><a href="http://video.people.cn/" target="_blank">人民视讯</a></li>
    <li><a href="http://www.people78.cn/" target="_blank">人民棋牌</a></li>
    <li><a href="http://peopletech.cn/" target="_blank">人民科技</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    <li><a href="https://coo.people.cn/" target="_blank">人民智作</a></li>
    </ul>
    </span>


    </body>
    </html>
