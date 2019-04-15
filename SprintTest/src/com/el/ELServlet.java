package com.el;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ELServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Dept dept = new Dept();
        dept.setDeptno(10);
        dept.setDname("NLDM教学部");
        dept.setLoc("北京市教学区");
        req.setAttribute("deptinfo", dept);
        req.getRequestDispatcher("jsp/el/dept_info.jsp")
                .forward(req, resp);
    }

    public void doPosot(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
