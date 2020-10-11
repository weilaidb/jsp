<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.io.*" %>
<%@ attribute name="filePath" required="true" %>
<%
    String fileName = filePath.substring(filePath.indexOf("/") + 1);
    response.setHeader("Content-disposition", "attachment;filename=" + fileName);
    //下载的文件
    try{
        //读取下载的文件，并发送给用户下载
        File f = new File(filePath);
        FileInputStream in = new FileInputStream(f);
        OutputStream o = response.getOutputStream();
        int n = 0;
        byte b[] = new byte[500];
        while ((n = in.read(b)) != -1) {
            o.write(b,0,n);
        }
        o.close();
        in.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>