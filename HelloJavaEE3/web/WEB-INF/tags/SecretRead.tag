<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.io.*" %>
<%@ attribute name="method" required="true" %>
<%@ variable name-given="content" scope="AT_END" %>
<%
    File dir = new File("D:/2000", "Students");
    File f = new File(dir, "save.txt");
    StringBuffer mess = new StringBuffer();
    String str;
    try{
        FileReader in = new FileReader(f);
        BufferedReader bufferin = new BufferedReader(in);
        String temp;
        while ((temp = bufferin.readLine()) != null) {
            mess.append(temp);
        }
        bufferin.close();
        in.close();
        str = new String(mess);
        if (method.equals("secret")) {
            jspContext.setAttribute("content", str);
        } else if (method.equals("unsecret")) {
            char a[] = str.toCharArray();
            for (int i = 0; i < a.length; i++) {
                a[i] = (char) (a[i] ^ 12);
                str = new String(a);
                jspContext.setAttribute("content", str);
            }
        }
        else{
            jspContext.setAttribute("content", "");
        }

    } catch (IOException e) {
        jspContext.setAttribute("content", "");
        e.printStackTrace();
    }
%>