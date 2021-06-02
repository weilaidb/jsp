<%@ tag pageEncoding="utf-8" %>
<%@ tag import="file.CFilePub" %>
<%@ tag import="java.util.List" %>
<%@ tag import="string.CStringPub" %>
<%@ tag import="java.util.Collections" %>
<%@ attribute name="topdir" required="true" %>
<%@ attribute name="findtext" required="true" %>
<%@ attribute name="casesensitive" required="true" %>
<%@ attribute name="findfileflag" required="true" %>
<%@ attribute name="enterflag" required="true" %>
<%@ variable name-given="showresult" scope="AT_END" %>
<%--<%@ variable name-given="listResult" variable-class="java.util.LinkedList" scope="AT_END" %>--%>
<%
    System.out.println("topdir:" + topdir);
    System.out.println("findtext:" + findtext);
    System.out.println("casesensitive:" + casesensitive);
    System.out.println("findfileflag :" + findfileflag);
//    List<String> listResultBuffer  = new LinkedList<String>();


    StringBuffer result = new StringBuffer();
    List<String> listcontent = CFilePub.readMenuAndUser(topdir);
    for (String item :
            listcontent) {
        //menu项为空
        if(CStringPub.isTrimEmpty(item))
        {
            continue;
        }
        //搜索字段为空，全部显示
        if(CStringPub.isTrimEmpty(findtext))
        {
            if(CStringPub.isTrimEmpty(enterflag)) {
                result.append(item + "<br>");
            }
            else
            {
                result.append(item + "\n");
            }
//            listResultBuffer.add(item + "<br>");
            continue;
        }

        //查找关键字列表，区分大小写时，如果不为空则表示区分大小写
        if(CStringPub.isContainList(item, findtext, casesensitive))
        {
            if(CStringPub.isTrimEmpty(enterflag)) {
                result.append(item + "<br>");
            }
            else
            {
                result.append(item + "\n");
            }
            continue;
//            listResultBuffer.add(item + "<br>");
        }

        if(CStringPub.isTrimEmpty(findfileflag))
        {
            continue;
        }

        //查找文件内容
        String readFileNameTips = CFilePub.getTipsName(item);
        String readFileNameBf = CFilePub.getBeforeName(item);
        String readFileNameAf = CFilePub.getAfterName(item);
        System.out.println("readFileNameTips:" + readFileNameTips);
        System.out.println("readFileNameBf:" + readFileNameBf);
        System.out.println("readFileNameAf:" + readFileNameAf);

        //查找文件内容
        String contTip = CFilePub.readFile(topdir, readFileNameTips, false);
        String contBf = CFilePub.readFile(topdir, readFileNameBf, false);
        String contAf = CFilePub.readFile(topdir, readFileNameAf, false);
        if((CStringPub.isContainList(contTip, findtext, casesensitive))
        ||(CStringPub.isContainList(contBf, findtext, casesensitive))
        ||(CStringPub.isContainList(contAf, findtext, casesensitive))
        )
        {
            if(CStringPub.isTrimEmpty(enterflag)) {
                result.append(item + "<br>");
            }
            else
            {
                result.append(item + "\n");
            }
            continue;
        }
    }
    jspContext.setAttribute("showresult", new String(result));
//    jspContext.setAttribute("listResult", listResultBuffer);
%>
