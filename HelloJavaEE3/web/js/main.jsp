<%@ page language="java" contentType="text/html;charSet=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>
        EAPN
    </title>
</head>

<frameset cols="170,15,*" frameborder="no" border="0" framespacing="0" id="ww">
    <FRAMESET border="0" name="fra" frameSpacing="0" frameBorder="no" rows="80,*" scrolling="YES">

        <frame src="logo.jsp" name="logoFrame" scrolling="No" id="logoFrame" title="logoFrame" />
        <frame src="menu.do" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame" />
    </FRAMESET>

    <FRAME name="barFrame" src="bar.do" frameBorder="NO" noResize="Y" scrolling="no">

    <FRAMESET border="0" name="ma" frameSpacing="0" frameBorder="no" rows="100%,*" scrolling="N">

        <frame src="audit.do" name="mainFrame" id="mainFrame" title="mainFrame" />

        <frame width='0' height='0' id="selectedItems" name="selectedItems" src='./js/temp.html' />
    </FRAMESET>

</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>