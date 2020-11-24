<HTML>
<HEAD>
    <TITLE></TITLE>
    <STYLE>.navPoint {
        FONT-SIZE: 12px; CURSOR: hand; FONT-FAMILY: "Webdings"
    }
    </STYLE>

</HEAD>
<script LANGUAGE="JavaScript">

    var hidden="false";

    function switchSysBarB(){
        var menu_img = document.getElementById("menu_img");

        if(hidden=="false") {

            parent.frames['ww'].cols='0,15,*';
            menu_img.src="././images/splitter_r.gif";
            hidden="true";

        } else {
            parent.frames['ww'].cols='170,15,*';
            menu_img.src="././images/splitter_l.gif";
            hidden="false";
        }

    }


</script>

<BODY text="#000000" background="././images/splitter_bg.gif" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">


<TABLE height="90%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD onMouseOver="this.style.cursor='move'" οnclick="switchSysBarB();" align="middle">
            <img src="././images/splitter_l.gif" style="cursor:hand" id="menu_img">
        </TD>
    </TR>
    </TBODY>
</TABLE>

</BODY>
</HTML>