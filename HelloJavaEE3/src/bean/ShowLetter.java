package bean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class ShowLetter extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;character=GB2312");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<br>Сд������ĸ:");
        for (char c = '��'; c <= '��'; c++) {
            out.print(" " + c);
        }
        out.println("<br>��д������ĸ:");
        for (char c = '��'; c <= '��'; c++) {
            out.print(" " + c);
        }
        out.println("</body></html>");
    }

}


