package com.listen;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletContextListenerDemo implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        System.out.println("** 容器初始化 -->"
                + event.getServletContext().getContextPath());
    }

    public void contextDestroyed(ServletContextEvent event) {
        System.out.println("***容器销毁 -->"
                + event.getServletContext().getContextPath());
    }
}
