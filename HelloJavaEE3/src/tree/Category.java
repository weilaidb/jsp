package tree;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Category implements TreeviewElement {
	protected int ID;//代表数据库中category_id列;
	protected int parentID;//代表数据库中parent_category_id列;
	protected String categoryName;//代表数据库中category_name列;
	protected String activeStatus="Y";//代表数据库中active_status列;
	public Category() {//无参的构造方法 
		this.ID = -1;
	}
	public Category(int id) {//有参的构造方法，参数为portlet_id
		this.ID = id;
		if (!FromDb())//如果有找到该id的porlet
			this.ID = -1;
	}
	public boolean FromDb() {//从数据库中读出，并更新bean
		int row = -1;
		//读记录的sql语句
		String sql = "select * from product_category where category_id=" + this.ID
				+ " and active_status='Y'";
		ResultSet rs = DbManager.getResultSet(sql);//执行sql语句并返回ResultSet
		try {
			rs.last();//移动到最后一行
			row = rs.getRow();//得到总记录数
			if (row == 1) {//如果只查询到一条记录，则代表该记录存在并更新该类的属性
				this.parentID = rs.getInt("PARENT_CATEGORY_ID");
				this.categoryName = rs.getString("CATEGORY_NAME");
				this.activeStatus = rs.getString("ACTIVE_STATUS");
				return true;
			} else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {//最后关闭ResutltSet,Statement.并释放连接
				if (rs != null)
					rs.close();
				if (rs.getStatement() != null)
					rs.getStatement().close();
				DbManager.releaseConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public String getActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getID() {
		return ID;
	}
	public void setID(int id) {
		ID = id;
	}
	public int getParentID() {
		return parentID;
	}
	public void setParentID(int parentID) {
		this.parentID = parentID;
	}
	public String getNodeName() {
		return getCategoryName();
	}
	public boolean canExpand() {
		String sql ="select category_id from product_category where parent_category_id="+getID();
		ResultSet rs = DbManager.getResultSet(sql);//执行sql语句并返回ResultSet
		try {
			rs.last();//移动到最后一行
			int row = rs.getRow();//得到总记录数
			if (row <= 0) 
				return false;
		    else
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {//最后关闭ResutltSet,Statement.并释放连接
				if (rs != null)
					rs.close();
				if (rs.getStatement() != null)
					rs.getStatement().close();
				DbManager.releaseConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public TreeviewElement[] getChildren() {
		String sql ="select category_id from product_category where parent_category_id="+getID();
		ResultSet rs = DbManager.getResultSet(sql);//执行sql语句并返回ResultSet
		try {
			rs.last();//移动到最后一行
			int row = rs.getRow();//得到总记录数
			if (row <= 0) {//如果没有子结点
				return null;//返回null
			}
		    else{//如果有子结点
		    	Vector vData = new Vector();
		    	rs.beforeFirst();
		    	while (rs.next())
		    		vData.add(""+rs.getInt("CATEGORY_ID"));
		    	TreeviewElement[] children = new TreeviewElement[vData.size()];
		    	for (int i=0;i<vData.size();i++)
		    	{
		    		int id = Integer.parseInt((String)vData.get(i));
		    		children[i] = new Category(id);
		    	}
		    	return children;//返回该记录的所有子结点
		    }
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {//最后关闭ResutltSet,Statement.并释放连接
				if (rs != null)
					rs.close();
				if (rs.getStatement() != null)
					rs.getStatement().close();
				DbManager.releaseConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
