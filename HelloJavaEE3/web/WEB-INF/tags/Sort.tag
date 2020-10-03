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
                listScore.set(i, (Double)listScore.get(j));
                listScore.set(j, r);
            }
        }
    }

    out.print("<table board = 1>");
    out.print("<tr>");
        out.print("<th>" + title + "</th>");
        out.print("<th>" + item + "</th>");
    out.print("<tr>");
    for(int k = 0; k < listName.size(); k++){
        out.print("<tr>");
        double score = (Double)listScore.get(k);
        String name = (String)listName.get(k);
        if(score< 60){
            out.print("<td bgcolor=yellow>" + name + "</td>");
            out.print("<td bgcolor=yellow" + score + "</td>");
        }
        else
        {
            out.print("<td>" + name + "</td>");
            out.print("<td>" + score + "</td>");
        }
        out.print("<tr>");
    }
    out.print("</table>");
%>

















