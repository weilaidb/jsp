<%@ tag pageEncoding="utf-8" %>
<%@attribute name="a" required="true" %>
<%@attribute name="b" required="true" %>
<%@attribute name="c" required="true" %>
<%@variable name-given="result" scope="AT_END" %>
<%
    String mess = "";
    try{
        double sideA = Double.parseDouble(a);
        double sideB = Double.parseDouble(b);
        double sideC = Double.parseDouble(c);
        if(sideA + sideB > sideC && sideA + sideC > sideB && sideC + sideB > sideA){
            double p = (sideA + sideB + sideC)/2.0;
            double area = Math.sqrt(p *(p - sideA) * (p - sideB) * (p - sideC));
            mess = "" + area;
        }
        else {
            mess = "不能构成一个三角形，无法计算面积。" ;
        }
    }

    catch (Exception e){
//        out.print("<br>" + "错误信息：" + e.toString());
        mess = "不能构成一个三角形，无法计算面积。error:" + e ;
    }
    jspContext.setAttribute("result", mess);
%>
