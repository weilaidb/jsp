package tree;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class treeviewRender {
	static public String renderStatic(TreeviewElement treeElmt, boolean bHidden) {
		StringBuffer content = new StringBuffer();
		content.append("<li id=" + treeElmt.getID() + ">");//显示li元素
		if (bHidden && treeElmt.canExpand())//如果可以展开并且初始化为隐藏,则显示展开图片，并添加showHide事件
			content.append("<img src=images/plus.gif onClick=\"showHide('"
					+ treeElmt.getID() + "')\">");
		else if (treeElmt.canExpand())//如果可以展开,则显示折叠图片，并添加showHide事件
			content.append("<img src=images/minus.gif onClick=\"showHide('"
					+ treeElmt.getID() + "')\">");
		else//否则显示空白图片
			content.append("<img src=images/blank.gif>");
		content.append("<img src=images/folder.gif><a href=\"#\"");//添加文件夹图片
		if (treeElmt.canExpand())//如果可以展开，为节点添加showHide事件
			content.append("onClick=\"showHide('" + treeElmt.getID() + "')\"");
		content.append(">" + treeElmt.getNodeName() + "</a>");
		if (treeElmt.canExpand()) {//如果可以展开，则用UL标记显示子结点 
			content.append("<ul");
			if (bHidden)
				content.append(" style=\"display:none;\" ");
			content.append(">");
			TreeviewElement[] elmts = treeElmt.getChildren();//获得此结点的子节点
			for (int i = 0; i < elmts.length; i++)
				content.append(renderStatic(elmts[i], bHidden));//递归调用显示子节点
			content.append("</ul>");
		}
		content.append("</li>");//结束显示<li>元素
		return content.toString();
	}

	static public TreeviewElement[] getTopCategory() {

		String sql = "select category_id from product_category where parent_category_id=0";
		ResultSet rs = DbManager.getResultSet(sql);// 执行sql语句并返回ResultSet
		try {
			rs.last();// 移动到最后一行
			int row = rs.getRow();// 得到总记录数
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
			try {// 最后关闭ResutltSet,Statement.并释放连接
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
