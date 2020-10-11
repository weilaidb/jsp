<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.util.*" %>
<%@ tag import="java.io.File" %>
<%@ tag import="java.io.FileWriter" %>
<%@ tag import="java.io.BufferedWriter" %>
<%@ tag import="java.io.IOException" %>
<%@ attribute name="dir" required="true" %>
<%@ attribute name="fileName" required="true" %>
<%@ attribute name="content" required="true" type="java.lang.String" %>
<%!
    public void writeContent(String str, File f) {
        try{
            FileWriter outfile = new FileWriter(f);
            BufferedWriter bufferout = new BufferedWriter(outfile);
            bufferout.write(str);
            bufferout.close();
            outfile.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
%>

<%
    File mulu = new File(dir);
    mulu.mkdirs();
    File f = new File(mulu, fileName);
    if (content.length() > 0) {
        writeContent(content, f);
        out.println("成功写入");
    }
%>
