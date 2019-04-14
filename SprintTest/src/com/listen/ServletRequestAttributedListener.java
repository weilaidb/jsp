package com.listen;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;

public class ServletRequestAttributedListener implements
        ServletRequestAttributeListener {
    public void attributeAdded(ServletRequestAttributeEvent event) {
        System.out.println("**增加reuqest属性-->属性名称:"
                + event.getName() + ",属性内容:"
                + event.getValue());
    }

    public void attributeRemoved(ServletRequestAttributeEvent event) {
        System.out.println("**删除request属性 -->属性名称:" +
                event.getName() + ", 属性内容:"
                + event.getValue());
    }

    public void attributeReplaced(ServletRequestAttributeEvent event) {
        System.out.println("**替换request属性-->属性名称:"
                + event.getName() + ",属性内容:"
                + event.getValue());
    }
}
