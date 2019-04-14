package com.listen;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HttpSessionListenerDemo implements
        HttpSessionListener {
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("**SESSION创建，SESSION ID=" + event.getSession().getId());
    }
    public void sessionDestroyed(HttpSessionEvent event)
    {
        System.out.println("SESSION销毁, SESSION ID = "
                + event.getSession().getId());
    }
}
