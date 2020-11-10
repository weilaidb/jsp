<%@ tag pageEncoding="utf-8" %>
<%@ tag import="file.CFilePub" %>
<%@ tag import="java.util.List" %>
<%@ tag import="string.CStringPub" %>
<%@ tag import="java.util.LinkedList" %>
<%@ attribute name="topdir" required="true" %>
<%@ attribute name="findtext" required="true" %>
<%@ attribute name="casesensitive" required="true" %>
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
        if(CStringPub.isTrimEmpty(findtext))
        {
            result.append(item + "<br>");
//            listResultBuffer.add(item + "<br>");
            continue;
        }
        if(CStringPub.isContainList(item, findtext, casesensitive))
        {
            result.append(item + "<br>");
//            listResultBuffer.add(item + "<br>");
        }
    }
    jspContext.setAttribute("showresult", new String(result));
//    jspContext.setAttribute("listResult", listResultBuffer);
%>
