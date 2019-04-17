package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class DynamicAddTag extends SimpleTagSupport implements
        DynamicAttributes {
    private Map<String, Float> num = new HashMap<String, Float>();

    public void doTag() throws JspException, IOException {
        Float sum = 0.0f;
        Iterator<Map.Entry<String, Float>> iter = this.num.entrySet()
                .iterator();
        while (iter.hasNext()) {
            Map.Entry<String, Float> value = iter.next();
            sum += value.getValue();
        }
        super.getJspContext().getOut().write("" + sum);
    }

    public void setDynamicAttribute(String uri, String localName, Object value)
            throws JspException {
        //取出设置的动态属性的内容
        num.put(localName, Float.parseFloat(value.toString()));
    }

}
