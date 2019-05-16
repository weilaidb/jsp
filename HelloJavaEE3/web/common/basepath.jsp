<%
    String basePath = application.getContextPath();
    String path = request.getContextPath();
    String docBase = application.getRealPath("/");
    String CurrentPath = request.getServletPath();
    String basePath2 = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    System.out.println("path          :" + path);
    System.out.println("basePath      :" + basePath);
    System.out.println("basePath2     :" + basePath2);
    System.out.println("CurrentPath   :" + CurrentPath);
    System.out.println("getServletPath:" + request.getServletPath());
%>
