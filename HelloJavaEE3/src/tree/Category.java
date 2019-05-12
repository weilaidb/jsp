package tree;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Category implements TreeviewElement {
	protected int ID;//�������ݿ���category_id��;
	protected int parentID;//�������ݿ���parent_category_id��;
	protected String categoryName;//�������ݿ���category_name��;
	protected String activeStatus="Y";//�������ݿ���active_status��;
	public Category() {//�޲εĹ��췽�� 
		this.ID = -1;
	}
	public Category(int id) {//�вεĹ��췽��������Ϊportlet_id
		this.ID = id;
		if (!FromDb())//������ҵ���id��porlet
			this.ID = -1;
	}
	public boolean FromDb() {//�����ݿ��ж�����������bean
		int row = -1;
		//����¼��sql���
		String sql = "select * from product_category where category_id=" + this.ID
				+ " and active_status='Y'";
		ResultSet rs = DbManager.getResultSet(sql);//ִ��sql��䲢����ResultSet
		try {
			rs.last();//�ƶ������һ��
			row = rs.getRow();//�õ��ܼ�¼��
			if (row == 1) {//���ֻ��ѯ��һ����¼�������ü�¼���ڲ����¸��������
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
			try {//���ر�ResutltSet,Statement.���ͷ�����
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
		ResultSet rs = DbManager.getResultSet(sql);//ִ��sql��䲢����ResultSet
		try {
			rs.last();//�ƶ������һ��
			int row = rs.getRow();//�õ��ܼ�¼��
			if (row <= 0) 
				return false;
		    else
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {//���ر�ResutltSet,Statement.���ͷ�����
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
		ResultSet rs = DbManager.getResultSet(sql);//ִ��sql��䲢����ResultSet
		try {
			rs.last();//�ƶ������һ��
			int row = rs.getRow();//�õ��ܼ�¼��
			if (row <= 0) {//���û���ӽ��
				return null;//����null
			}
		    else{//������ӽ��
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
		    	return children;//���ظü�¼�������ӽ��
		    }
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {//���ر�ResutltSet,Statement.���ͷ�����
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
