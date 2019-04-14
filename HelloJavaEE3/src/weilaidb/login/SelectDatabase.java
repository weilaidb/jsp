package weilaidb.login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

public class SelectDatabase extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter tow = resp.getWriter();
        resp.setCharacterEncoding("utf-8");
        String qrydata = req.getParameter("qrydata");
        out.println("to query data:" + qrydata);
        System.out.print("to query data:" + qrydata);
        tow.write("查询的数据:" + qrydata);
//        resp.setHeader("<h1>" + "to qry data:" + qrydata + "</h1>");
//        tow.write("习大大吃包子....");
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
