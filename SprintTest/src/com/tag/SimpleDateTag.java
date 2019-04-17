package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDateTag extends SimpleTagSupport {
    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    private String format;

    public void doTag() throws JspException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat(this.format);
        try {
            super.getJspContext().getOut().write(sdf.format(new Date()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
