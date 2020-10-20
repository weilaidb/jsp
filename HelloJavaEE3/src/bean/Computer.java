package bean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class Computer extends HttpServlet {
    String servletName;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        servletName = getServletName();
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;character=GB2312");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        String str = request.getParameter("number");
        out.println("我是一个servlet对象，名字是:" + servletName + "。<br>");
        out.println("我负责计算并显示:" + str + "的因子:<br>");
        int n = 0;
        try{
            n = Integer.parseInt(str);
            for (int i = 1; i <=n ; i++) {
                if (n % i == 0) {
                    out.println(" " + i);
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println(" " + e);
        }
        out.println("</body></html>");
    }

}


