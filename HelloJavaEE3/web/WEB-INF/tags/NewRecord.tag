<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ attribute name="number" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="year" required="true" %>
<%@ attribute name="price" required="true" %>
<%
    float p = Float.parseFloat(price);
    String condition1 = "UPDATE product SET name='" + name +
            "' WHERE number=" + "'" + number +"'" ,
            condition2 = "UPDATE product SET year='" + year +
                    "' WHERE number=" + "'" + number +"'" ,
            condition3 = "UPDATE product SET price='" + price +
                    "' WHERE number=" + "'" + number +"'" ;

    out.println("<br>" + condition1);
    out.println("<br>" + condition2);
    out.println("<br>" + condition3);


    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    } finally {
    }

    Connection con = null;
    Statement sql;
    ResultSet rs;
    int n = 0;

    try{
        String uri = "jdbc:mysql://localhost:3306/" + "warehouse" + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        String user = "root";
        String password = "Zzerp123";
        con = DriverManager.getConnection(uri, user, password);
        sql = con.createStatement();
        sql.executeUpdate(condition1);
        sql.executeUpdate(condition2);
        sql.executeUpdate(condition3);
        con.close();
    } catch (SQLException e) {
        out.println("" + e);
    }

%>