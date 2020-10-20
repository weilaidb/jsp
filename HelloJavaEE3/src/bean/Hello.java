package bean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 */
public class Hello extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;character=GB2312");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>ÄúºÃ£¬»¶Ó­Ñ§Ï°servlet¡£</h2>");
        out.println("</body></html>");
    }

}



