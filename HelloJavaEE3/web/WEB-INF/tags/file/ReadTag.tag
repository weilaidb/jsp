<%@ tag import="java.io.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="dir" required="true" %>
<%@ attribute name="fileName" required="true" %>
<%@ variable name-given="result" scope="AT_END" %>
<%!
    public String readContent(File f) {
        StringBuffer str = new StringBuffer();
        try{
            InputStreamReader in = new InputStreamReader(new FileInputStream(f), "UTF-8");
            BufferedReader bufferin = new BufferedReader(in);
            String temp;
            while ((temp = bufferin.readLine()) != null) {
//                str.append(temp + "<br>");
                str.append(temp + "\n");
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