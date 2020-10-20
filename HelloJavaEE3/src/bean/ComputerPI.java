package bean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


public class ComputerPI extends HttpServlet {
    double sum = 0,i = 1,j = 1;
    int number = 0;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public synchronized void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;character=GB2312");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        number++;
        sum = sum + i/j;
        j = j + 2;
        i = -i;
        out.println("servlet:" + getServletName() + "已经请求了" + number + "次");
        out.println("<br>现在PI的值是:");
        out.println(4 * sum);
        out.println("</body></html>");
    }

}



