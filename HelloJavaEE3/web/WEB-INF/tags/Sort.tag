<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="listName" required="true" type="java.util.LinkedList" %>
<%@ attribute name="listScore" required="true" type="java.util.LinkedList" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="item" required="true" %>
<%
    for(int i = 0; i < listName.size(); i++)
    {
        for (int j = i + 1; j < listName.size(); j++)
        {
            double a = ((Double)listScore.get(i)).doubleValue();
            double b = ((Double)listScore.get(j)).doubleValue();
            if(b < a) {
                String temp = (String)listName.get(i);
                Double r = (Double)listScore.get(i);
                listName.set(i, (String)listName.get(j));
                listName.set(j, temp);
                listScore.set(i, (String)listScore.get(j));
                listScore.set(j, r);
            }
        }
    }

    out.print("<table board = 1>");
    out.print("<tr>");
        out.print("<th>" + title + "</th>");
        out.print("<th>" + item + "</th>");
    out.print("<tr>");



%>

















