package weilaidb.sqlite;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthTextAreaUI;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "SqliteServlet")
public class SqliteServlet extends HttpServlet {
    private String message;

    @Override
    public void init() throws ServletException {
        message = "sqlite3, for more interesting!";
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //设置响应内容类型
//        response.setContentType("text/html");
//
//        //设置逻辑实现
//        PrintWriter out = response.getWriter();
//        out.println("<h1>" + message + "</h1>");
//        out.println("<h1>" + message + "</h1>");
//        out.println("<h1>" + message + "</h1>");
//        out.println("<h1>" + message + "</h1>");
//        out.println("<h1>" + message + "</h1>");
    }

    public String gbkstr(String txt)
    {
//        txt.getBytes("iso-8859-1"),
        try {
            return  new String(txt.getBytes("iso-8859-1"), "utf-8");
        } catch (Exception e)
        {
//            System.out.printlne;
            e.printStackTrace();
        }
        return "";
    }

    public void dosqlite3test(PrintWriter out) {
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
//            String dbpath = "jdbc:sqlite://E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\HelloJavaEE3\\test23.db";
//            String dbpath = "jdbc:sqlite://E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\HelloJavaEE3\\test23444.db";
//            String dbpath = "jdbc:sqlite://E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\HelloJavaEE3\\test23444.db";
//            String dbpath = "jdbc:sqlite://E:/tarbao/egjsp/eclipse-workspace/TomcatTest/HelloJavaEE3/test23444555.db";
            String dbpath = "jdbc:sqlite://D:/test23444555666.db";


            connection = DriverManager.getConnection(dbpath);
//            connection = DriverManager.getConnection("jdbc:sqlite:test23.db");
            Statement statement=connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口
            String sql="create table tables(name varchar(20),pwd varchar(20))";
            statement.executeUpdate("drop table if exists tables");//判断是否有表tables的存在。有则删除
            statement.executeUpdate(sql);            //创建数据库
            statement.executeUpdate("insert into tables values('zhou','156546')");//向数据库中插入数据
            for (int i = 0; i < 100; i++) {
//                out.println("<h1>" + message + "</h1>");
                statement.executeUpdate("insert into tables values('zhou22','1565463')");//向数据库中插入数据
            }
            ResultSet rSet=statement.executeQuery("select * from tables");//搜索数据库，将搜索的放入数据集ResultSet中
            while (rSet.next()) {            //遍历这个数据集
                out.println("姓名："+rSet.getString(1));//依次输出 也可以这样写 rSet.getString(“name”)
                out.print("<br />");
                out.println("密码："+rSet.getString("pwd"));
                out.print("<br />");

//
//                out.println("<h1>" + "姓名："+rSet.getString(1)+ "</h1>");//依次输出 也可以这样写 rSet.getString(“name”)
//                out.print("<br />");
//                out.println("<h1>" + "密码："+rSet.getString("pwd")+ "</h1>");
//                out.print("<br />");
            }
            rSet.close();//关闭数据集
            connection.close();//关闭数据库连接
//            out.println("Opened database successfully");
        } catch ( Exception e ) {
            out.println("open database failed!!!");
            out.println(e.getClass().getName() + ": " + e.getMessage() );
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应内容类型
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        //设置逻辑实现
        PrintWriter out = response.getWriter();
        for (int i = 0; i < 1; i++) {
            out.println("<h1>" + message + "</h1>");
        }
        dosqlite3test(out);
    }
}
