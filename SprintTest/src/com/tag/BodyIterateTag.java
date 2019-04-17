package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

public class BodyIterateTag extends BodyTagSupport {
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

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    private String id;
    private Iterator<?> iter;

    public int doStartTag() throws JspException {
        Object value = null;
        if ("page".equals(this.scope)) {
            value = super.pageContext
                    .getAttribute(name, PageContext.PAGE_SCOPE);
        } else if ("request".equals(this.scope)) {
            value = super.pageContext
                    .getAttribute(name, pageContext.REQUEST_SCOPE);
        } else if ("session".equals(this.scope)) {
            value = super.pageContext
                    .getAttribute(name, pageContext.SESSION_SCOPE);
        } else {
            value = super.pageContext
                    .getAttribute(name, pageContext.APPLICATION_SCOPE);
        }

        if (value != null && value instanceof List<?>) {
            this.iter = ((List<?>) value).iterator();
            if (iter.hasNext()) {
                super.pageContext.setAttribute(id, iter.next());
                return BodyTagSupport.EVAL_BODY_BUFFERED;
            } else {
                return BodyTagSupport.SKIP_BODY;
            }
        } else {
            return BodyTagSupport.SKIP_BODY;
        }
    }

    public int doAfterBody() throws JspException {
        if (iter.hasNext()) {
            super.pageContext.setAttribute(id, iter.next());
            return BodyTagSupport.EVAL_BODY_AGAIN;
        } else {
            return BodyTagSupport.SKIP_BODY;
        }
    }

    public int doEndTag() throws JspException {
        if (super.bodyContent != null) {
            try {
                super.bodyContent.writeOut(super.getPreviousOut());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return BodyTagSupport.EVAL_PAGE;//正常执行完毕
    }

}
