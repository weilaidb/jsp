package tree;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class treeviewRender {
	static public String renderStatic(TreeviewElement treeElmt, boolean bHidden) {
		StringBuffer content = new StringBuffer();
		content.append("<li id=" + treeElmt.getID() + ">");//��ʾliԪ��
		if (bHidden && treeElmt.canExpand())//�������չ�����ҳ�ʼ��Ϊ����,����ʾչ��ͼƬ�������showHide�¼�
			content.append("<img src=images/plus.gif onClick=\"showHide('"
					+ treeElmt.getID() + "')\">");
		else if (treeElmt.canExpand())//�������չ��,����ʾ�۵�ͼƬ�������showHide�¼�
			content.append("<img src=images/minus.gif onClick=\"showHide('"
					+ treeElmt.getID() + "')\">");
		else//������ʾ�հ�ͼƬ
			content.append("<img src=images/blank.gif>");
		content.append("<img src=images/folder.gif><a href=\"#\"");//����ļ���ͼƬ
		if (treeElmt.canExpand())//�������չ����Ϊ�ڵ����showHide�¼�
			content.append("onClick=\"showHide('" + treeElmt.getID() + "')\"");
		content.append(">" + treeElmt.getNodeName() + "</a>");
		if (treeElmt.canExpand()) {//�������չ��������UL�����ʾ�ӽ�� 
			content.append("<ul");
			if (bHidden)
				content.append(" style=\"display:none;\" ");
			content.append(">");
			TreeviewElement[] elmts = treeElmt.getChildren();//��ô˽����ӽڵ�
			for (int i = 0; i < elmts.length; i++)
				content.append(renderStatic(elmts[i], bHidden));//�ݹ������ʾ�ӽڵ�
			content.append("</ul>");
		}
		content.append("</li>");//������ʾ<li>Ԫ��
		return content.toString();
	}

	static public TreeviewElement[] getTopCategory() {

		String sql = "select category_id from product_category where parent_category_id=0";
		ResultSet rs = DbManager.getResultSet(sql);// ִ��sql��䲢����ResultSet
		try {
			rs.last();// �ƶ������һ��
			int row = rs.getRow();// �õ��ܼ�¼��
			if (row <= 0) {
				return null;
			} else {
				Vector vData = new Vector();
				rs.beforeFirst();
				while (rs.next())
					vData.add("" + rs.getInt("CATEGORY_ID"));
				TreeviewElement[] children = new TreeviewElement[vData.size()];
				for (int i = 0; i < vData.size(); i++) {
					int id = Integer.parseInt((String) vData.get(i));
					children[i] = new Category(id);
				}
				return children;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {// ���ر�ResutltSet,Statement.���ͷ�����
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
	static public String renderSimple(TreeviewElement treeElmt) {
		StringBuffer content = new StringBuffer();
		content.append("<li id=" + treeElmt.getID() + "><a href=\"#\">");
		content.append( treeElmt.getNodeName() + "</a>");
		if (treeElmt.canExpand()) {
			content.append("<ul>");
			TreeviewElement[] elmts = treeElmt.getChildren();
			for (int i = 0; i < elmts.length; i++)
				content.append(renderSimple(elmts[i]));
			content.append("</ul>");
		}
		content.append("</li>");
		return content.toString();
	}
	static public String renderTreeViewAjax(TreeviewElement treeElmt,boolean bRenderChildren) {
		StringBuffer content = new StringBuffer();
		content.append("<li id="+treeElmt.getID()+">");
	    if (treeElmt.canExpand())
			content.append("<img src=images/plus.gif onClick=\"getSubTree('"+treeElmt.getID()+"')\">");
		else
			content.append("<img src=images/blank.gif>");
		content.append("<img src=images/folder.gif><a href=\"#\"");
		if (treeElmt.canExpand())
		  content.append(" onClick=\"getSubTree('"+treeElmt.getID()+"')\"");
		content.append(">"+treeElmt.getNodeName()+"</a>");
		
		if ( bRenderChildren&&treeElmt.canExpand( ))
		{
			content.append("<ul>");
			TreeviewElement[] elmts = treeElmt.getChildren();
			for (int i=0;i<elmts.length;i++)
				content.append(renderTreeViewAjax(elmts[i],false));
			content.append("</ul>");
		}
		
		content.append("</li>");
		return content.toString();
	}
}
