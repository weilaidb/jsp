package com.listen;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Set;
import java.util.TreeSet;

public class OnlineUserList implements
        HttpSessionAttributeListener, HttpSessionListener,
        ServletContextListener {
    private ServletContext app = null;

    public void contextInitialized(ServletContextEvent arg0) {
        this.app = arg0.getServletContext();
        this.app.setAttribute("online", new TreeSet<>());
    }

    public void attributeAdded(HttpSessionBindingEvent event) {
        Set all = (Set) this.app.getAttribute("online");
        all.add(event.getValue());
        this.app.setAttribute("online", all);
    }

    public void attributeRemoved(HttpSessionBindingEvent event) {
        Set all = (Set) this.app.getAttribute("online");
        all.remove(event.getName());
        this.app.setAttribute("online", all);
    }

    public void sessionDestroyed(HttpSessionEvent event) {
        Set all = (Set) this.app.getAttribute("online");
        all.remove(event.getSession().getAttribute("userid"));
        this.app.setAttribute("online", all);
    }

    public void attributeReplaced(HttpSessionBindingEvent event) {

    }

    public void sessionCreated(HttpSessionEvent event) {

    }

    public void contextDestroyed(ServletContextEvent event) {

    }

}
