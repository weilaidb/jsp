package bean;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class Show extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        response.setContentType("text/html;character=GB2312");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        String s = request.getParameter("str");
        int n = s.length();
        out.print("\"" + s + "\"" +"�ĳ���:" + n  + "<br>");
        out.println("</body></html>");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        doPost(request, response);
        response.setContentType("text/html;character=GB2312");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        String s = request.getParameter("str");
        if (null != s && s.startsWith("Hello")) {
            out.print("\"" + s + "\"" + "��ǰ׺��:Hello");
        } else {
            out.print("\"" + s + "\"" + "��ǰ׺����:Hello");
        }
        out.println("</body></html>");
    }
}


