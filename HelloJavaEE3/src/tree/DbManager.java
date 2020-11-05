package tree;

import java.sql.*;

public class DbManager {
	//���ԱConnection
	protected static Connection conn;
    //mysql�������࣬����Ϊ����
	public static final String CLASS_NAME = "org.sqlite.JDBC";
    //���ݿ�����ӵ�ַ������Ϊ����
	public static final String CONNET_STR = "jdbc:mysql://localhost/menu";
    //���Connetion
	public static Connection getConnection() {
		try {
			Class.forName(CLASS_NAME);//ʹ���෴����ظ�������
			//���һ��Connection
			conn = DriverManager.getConnection(CONNET_STR, "root", "");
			return conn;//���ظ�Connection
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	//�����ѯ���ݿ��sql��䣬����ResultSet
	public static ResultSet getResultSet(String sql) {
		boolean bSuccess = true;
		Statement stmt = null;//����Statement stmt
		ResultSet rs = null;//����ResultSet rs
		Connection con = getConnection();//����getConnetion()�������һ��Connetion
		if (con == null)//���Connection Ϊnull�򷵻ؼ�
			bSuccess = false;
		if (bSuccess) {
			try {		
				stmt = con.createStatement();//ͨ��Connection����һ��Statemet
				rs = stmt.executeQuery(sql);//ִ�в�ѯ��䣬
			} catch (SQLException e) {
				e.printStackTrace();
				bSuccess = false;
			}
		}
		if (bSuccess)//���ִ�гɹ����򷵻�rs
			return rs;
		else
			return null;
	}
   //����ִ�����ݸ��µ���䣬���ظ��½������Ϊ�ɹ�ִ��
	public static boolean excute(String sql) {
		boolean bSuccess = true;
		Statement stmt = null;//����Statement stmt
		Connection con = getConnection();//����getConnetion()�������һ��Connetion
		if (con == null)//���Connection Ϊnull�򷵻ؼ�
			bSuccess = false;
		if (bSuccess) {
			try {
				stmt = con.createStatement();//ͨ��Connection����һ��Statemet
				bSuccess = stmt.execute(sql);//ִ�и������ݲ���
			} catch (SQLException e) {
				e.printStackTrace();
				bSuccess = false;
			}
		}
		return bSuccess;
	}
    //�ͷ�Connection
	public static void releaseConnection() {
		try {
			if (conn != null)//  ���Connetion ��Ϊnull��ر�Connection
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
