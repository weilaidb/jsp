<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.io.*" %>
<%@ attribute name="fileContent" required="true" %>
<%@ attribute name="fileDir" required="true" %>
<%@ attribute name="fileName" required="true" %>

<%
    File f  = new File(fileDir, fileName);
    try{
        FileOutputStream output = new FileOutputStream(f);
        byte bb[] = fileContent.getBytes();
        output.write(bb,0,bb.length);
        output.close();
        out.println("文件写入成功!");
        out.println("<br>文件所在目录:" + fileDir);
        out.println("<br>文件的名字:" + fileName);
    } catch (IOException e) {
        out.println("文件写入失败" + e);
        e.printStackTrace();
    }
%>