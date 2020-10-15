<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.Calendar" %>
<%@ attribute name="number" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="year" required="true" %>
<%@ attribute name="price" required="true" %>
<%
    float p = Float.parseFloat(price);

    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    } finally {
    }

    Connection con = null;
    Statement sql;
    PreparedStatement pre;
    ResultSet rs;
    int n = 0;
    Calendar calendar = Calendar.getInstance();

    try{
        String uri = "jdbc:mysql://localhost:3306/" + "warehouse" + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        String user = "root";
        String password = "Zzerp123";
        con = DriverManager.getConnection(uri, user, password);
        String insertCondition = "INSERT INTO product VALUES(?,?,?,?)";
        pre = con.prepareStatement(insertCondition);
        pre.setString(1, number);
        pre.setString(2, name);
        pre.setDouble(3, p);
        pre.setString(4,year);
        int m = pre.executeUpdate();
        if (m != 0) {
            out.println("对表中插入" + m + "条记录成功");
        }
    } catch (SQLException e) {
        out.println("" + e);
    }

%>