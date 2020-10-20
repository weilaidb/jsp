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
        out.println("<br>小写俄文字母:");
        for (char c = 'а'; c <= 'я'; c++) {
            out.print(" " + c);
        }
        out.println("<br>大写俄文字母:");
        for (char c = 'А'; c <= 'Я'; c++) {
            out.print(" " + c);
        }
        out.println("</body></html>");
    }

}


