package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class SimpleIterateTag extends SimpleTagSupport {
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    private String id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    private String scope;

    public void doTag() throws JspException, IOException {
        Object value = null;
        if ("page".equals(this.scope)) {
            value = super.getJspContext().getAttribute(name,
                    PageContext.PAGE_SCOPE);
        } else if ("request".equals(this.scope)) {
            value = super.getJspContext().getAttribute(name,
                    PageContext.REQUEST_SCOPE);
        } else if ("session".equals(this.scope)) {
            value = super.getJspContext().getAttribute(name,
                    PageContext.SESSION_SCOPE);
        } else {
            value = super.getJspContext().getAttribute(name,
                    PageContext.APPLICATION_SCOPE);
        }

        if(value != null && value instanceof List<?>){
            Iterator<?> iter = ((List<?>)value).iterator();
            while(iter.hasNext()){
                super.getJspContext().setAttribute(id, iter.next());
                super.getJspBody().invoke(null);
            }
        }
    }
}
