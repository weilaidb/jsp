package com.listen;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginUser implements HttpSessionBindingListener {
    private String name;

    public LoginUser(String name) {
        this.setName(name);
    }

    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println("**在session中保存LoginUser对象(name = "
                + this.getName() + "),session id=" + event.getSession().getId());
    }

    public void valueUnbound(HttpSessionBindingEvent event) {
        System.out.println("**从session中移除LoginUser对象(name="
                + this.getName() + "),session id =" + event.getSession().getId());
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
