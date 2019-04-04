<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.*" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/3
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    BigInteger count = null;
%>
<%!
    public BigInteger load(File file) {
        BigInteger count = null;
        try {
            if (file.exists()) {
                Scanner scan = null;
                scan = new Scanner(new FileInputStream(file));
                if (scan.hasNext()) {
                    count = new BigInteger(scan.next());
                }
                scan.close();
            } else {
                count = new BigInteger("0");
                save(file, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public void save(File file, BigInteger count)
    {
        try{
            PrintStream ps = null;
            ps =  new PrintStream(new FileOutputStream(file));
            ps.println(count);
            ps.close();
        } catch (Exception e )
        {
            e.printStackTrace();
        }
    }
%>


<%
    String fileName = application.getRealPath("/") + "count.txt";
    File file = new File(fileName);
    if (session.isNew()) {
        synchronized (this){
            count = load(file);
            count = count.add(new BigInteger("1"));
            save(file,count);
        }
    }
%>

<h2>您是第<%=count==null ?0:count%>位访客!</h2>


</body>

</html>
