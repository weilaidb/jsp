package weilaidb.sqlite;
import java.sql.*;

public class SQLiteJDBC {
    public static void main( String args[] )
    {
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:test23.db");
            Statement statement=connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口
            String sql="create table tables(name varchar(20),pwd varchar(20))";
            statement.executeUpdate("drop table if exists tables");//判断是否有表tables的存在。有则删除
            statement.executeUpdate(sql);            //创建数据库
            statement.executeUpdate("insert into tables values('zhou','156546')");//向数据库中插入数据
            statement.executeUpdate("insert into tables values('zhou22','1565463')");//向数据库中插入数据
            ResultSet rSet=statement.executeQuery("select * from tables");//搜索数据库，将搜索的放入数据集ResultSet中
            while (rSet.next()) {            //遍历这个数据集
                System.out.println("姓名："+rSet.getString(1));//依次输出 也可以这样写 rSet.getString(“name”)
                System.out.println("密码："+rSet.getString("pwd"));
            }
            rSet.close();//关闭数据集
            connection.close();//关闭数据库连接
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        System.out.println("Opened database successfully");

    }

}
