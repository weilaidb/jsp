<%@ tag import="java.io.File" %>
<%@ tag import="java.io.FileReader" %>
<%@ tag import="java.io.BufferedReader" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="dir" required="true" %>
<%@ attribute name="fileName" required="true" %>
<%@ variable name-given="result" scope="AT_END" %>
<%!
    public String readContent(File f) {
        StringBuffer str = new StringBuffer();
        try{
            FileReader in = new FileReader(f);
            BufferedReader bufferin = new BufferedReader(in);
            String temp;
            while ((temp = bufferin.readLine()) != null) {
                str.append(temp);
            }
            bufferin.close();
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new String(str);
    }
%>

<%
    File f = new File(dir,fileName);
    String fileContent = readContent(f);
    jspContext.setAttribute("result", fileContent);//返回对象result
%>