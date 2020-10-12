<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.io.*" %>
<%@ attribute name="fileDir" required="true" %>
<%@ attribute name="fileName" required="true" %>
<%
    File dir = new File(fileDir);
    File f = new File(dir, fileName);
    try{
        FileInputStream in = new FileInputStream(f);
        int m = -1;
        byte bb[] = new byte[1024];
        String content = null;
        while((m = in.read(bb)) != -1)
        {
            content = new String(bb, 0, m);
            out.println(content);
        }
        in.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("文件读取失败" + e);
    }
%>