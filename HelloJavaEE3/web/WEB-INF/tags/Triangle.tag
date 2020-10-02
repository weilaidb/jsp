<%@ tag pageEncoding="utf-8" %>
<%@attribute name="sideA" required="true" %>
<%@attribute name="sideB" required="true" %>
<%@attribute name="sideC" required="true" %>
<%!
    public String getArea(double a, double b, double c)
    {
        if(a + b> c && a + c > b && c + b > a){
            double p= (a + b + c)/2.0;
            double area = Math.sqrt(p *(p - a) * (p - b) * (p - c));
            return "<br>三角形的面积:" + area;
        }
        else
            return ("<br>" + a + "," + b + "," + c +"不能构成一个三角形，无法计算面积。");
    }
%>

<%
    out.println("<br>JSP页面传递过来的三条边：" + sideA + "," + sideB + "," + sideC);
    double a = Double.parseDouble(sideA);
    double b = Double.parseDouble(sideB);
    double c = Double.parseDouble(sideC);
    out.println(getArea(a,b,c));
%>


















