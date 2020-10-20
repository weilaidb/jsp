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
        out.println("����һ��servlet����������:" + servletName + "��<br>");
        out.println("�Ҹ�����㲢��ʾ:" + str + "������:<br>");
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


