package com.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServerRedirectDemo extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getSession().setAttribute("name", "李李李");
        req.setAttribute("info", "SSSSSSSSSSSS");
//        实例化 RequestDispatcher对象，同时指定跳转路径
        RequestDispatcher rd = req.getRequestDispatcher("jsp/servlet/get_info.jsp");
        rd.forward(req,resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
