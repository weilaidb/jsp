package weilaidb.login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String path   = "sql/login/login.jsp";
        String okpath = "sql/bselectdb.jsp";
        String userid = req.getParameter("userid");
        String userpass = req.getParameter("userpass");
        List<String> info = new ArrayList<String>();
        if (userid == null || "".equals(userid)) {
            info.add("用户id不能为空!");
        }
        if (userpass == null || "".equals(userpass)) {
            info.add("密码不能为空!");
        }
        if (info.size() == 0) {
            User user = new User();
            user.setUserid(userid);
            user.setPassword(userpass);
            try {
                if (DAOFactory.getIUSerDAOInstance().findLogin(user)) {
                    info.add("用户登陆成功，欢迎" + user.getName() + "光临!");
                    req.setAttribute("info", info);
                    req.getRequestDispatcher(okpath).forward(req, resp);
                    return;
                } else {
                    info.add("用户登陆失败,错误的用户名和密码!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        req.setAttribute("info", info);
        req.getRequestDispatcher(path).forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
