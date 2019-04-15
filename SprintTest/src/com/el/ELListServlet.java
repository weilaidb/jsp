package com.el;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ELListServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Dept> all = new ArrayList<Dept>();
        Dept dept = null;
        dept = new Dept();
        dept.setDeptno(10);
        dept.setDname("学苑");
        dept.setLoc("北京");
        all.add(dept);

        dept = new Dept();
        dept.setDeptno(20);
        dept.setDname("学苑2");
        dept.setLoc("北京2");
        all.add(dept);

        req.setAttribute("alldept", all);
        req.getRequestDispatcher("jsp/el/dept_list.jsp")
                .forward(req, resp);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
