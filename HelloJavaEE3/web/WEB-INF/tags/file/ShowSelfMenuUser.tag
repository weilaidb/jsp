<%@ tag pageEncoding="utf-8" %>
<%@ tag import="file.CFilePub" %>
<%@ tag import="java.util.List" %>
<%@ tag import="string.CStringPub" %>
<%@ attribute name="topdir" required="true" %>
<%@ attribute name="findtext" required="true" %>
<%@ attribute name="casesensitive" required="true" %>
<%@ attribute name="findfileflag" required="true" %>
<%@ variable name-given="showresult" scope="AT_END" %>
<%--<%@ variable name-given="listResult" variable-class="java.util.LinkedList" scope="AT_END" %>--%>
<%
    System.out.println("topdir:" + topdir);
    System.out.println("findtext:" + findtext);
    System.out.println("casesensitive:" + casesensitive);
//    List<String> listResultBuffer  = new LinkedList<String>();


    StringBuffer result = new StringBuffer();
    List<String> listcontent = CFilePub.readMenuAndUser(topdir);
    for (String item :
            listcontent) {
        if(CStringPub.isTrimEmpty(item))
        {
            continue;
        }
        if(CStringPub.isTrimEmpty(findtext))
        {
            result.append(item + "<br>");
//            listResultBuffer.add(item + "<br>");
            continue;
        }

        //查找关键字列表
        if(CStringPub.isContainList(item, findtext, casesensitive))
        {
            result.append(item + "<br>");
            continue;
//            listResultBuffer.add(item + "<br>");
        }

        String readFileNameTips = CFilePub.getTipsName(item);
        String readFileNameBf = CFilePub.getBeforeName(item);
        String readFileNameAf = CFilePub.getAfterName(item);
        //查找文件内容
        String contTip = CFilePub.readFile(topdir, readFileNameTips, false);
        String contBf = CFilePub.readFile(topdir, readFileNameBf, false);
        String contAf = CFilePub.readFile(topdir, readFileNameAf, false);
        if((CStringPub.isContainList(contTip, findtext, casesensitive))
        ||(CStringPub.isContainList(contBf, findtext, casesensitive))
        ||(CStringPub.isContainList(contAf, findtext, casesensitive))
        )
        {
            result.append(item + "<br>");
            continue;
        }
    }
    jspContext.setAttribute("showresult", new String(result));
//    jspContext.setAttribute("listResult", listResultBuffer);
%>
