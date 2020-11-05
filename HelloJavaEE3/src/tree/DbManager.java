package tree;

import java.sql.*;

public class DbManager {
	//类成员Connection
	protected static Connection conn;
    //mysql的驱动类，定义为常量
	public static final String CLASS_NAME = "org.sqlite.JDBC";
    //数据库的连接地址，定义为常量
	public static final String CONNET_STR = "jdbc:mysql://localhost/menu";
    //获得Connetion
	public static Connection getConnection() {
		try {
			Class.forName(CLASS_NAME);//使用类反射加载该驱动类
			//获得一个Connection
			conn = DriverManager.getConnection(CONNET_STR, "root", "");
			return conn;//返回该Connection
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	//传入查询数据库的sql语句，返回ResultSet
	public static ResultSet getResultSet(String sql) {
		boolean bSuccess = true;
		Statement stmt = null;//声明Statement stmt
		ResultSet rs = null;//声明ResultSet rs
		Connection con = getConnection();//调用getConnetion()方法获得一个Connetion
		if (con == null)//如果Connection 为null则返回假
			bSuccess = false;
		if (bSuccess) {
			try {		
				stmt = con.createStatement();//通过Connection创建一个Statemet
				rs = stmt.executeQuery(sql);//执行查询语句，
			} catch (SQLException e) {
				e.printStackTrace();
				bSuccess = false;
			}
		}
		if (bSuccess)//如果执行成功，则返回rs
			return rs;
		else
			return null;
	}
   //传入执行数据更新的语句，返回更新结果，真为成功执行
	public static boolean excute(String sql) {
		boolean bSuccess = true;
		Statement stmt = null;//声明Statement stmt
		Connection con = getConnection();//调用getConnetion()方法获得一个Connetion
		if (con == null)//如果Connection 为null则返回假
			bSuccess = false;
		if (bSuccess) {
			try {
				stmt = con.createStatement();//通过Connection创建一个Statemet
				bSuccess = stmt.execute(sql);//执行更新数据操作
			} catch (SQLException e) {
				e.printStackTrace();
				bSuccess = false;
			}
		}
		return bSuccess;
	}
    //释放Connection
	public static void releaseConnection() {
		try {
			if (conn != null)//  如果Connetion 不为null则关闭Connection
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
