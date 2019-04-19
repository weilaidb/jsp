package weilaidb.explorer;

import com.cmd.RunCmd;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class OpenPath  extends HttpServlet {
    private String message;

    @Override
    public void init() throws ServletException {
        message = "OpenPath, this message is from servlet!" +
                "so nice things!!";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置响应内容类型
        resp.setContentType("text/html");
        String openpath = req.getParameter("openpath");
        //设置逻辑实现
        PrintWriter out = resp.getWriter();


        out.println("<h1>" + openpath + "</h1>");
        RunCmd.explorerdir(openpath);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
