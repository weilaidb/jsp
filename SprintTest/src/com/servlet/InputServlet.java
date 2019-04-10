package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class InputServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String info = req.getParameter("info");
        PrintWriter out = resp.getWriter();
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        out.println("<html>");
        out.println("<head><title>Input Servlet</title></head>");
        out.println("<body>");
        out.println("<h1>" + info + "</h1>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
