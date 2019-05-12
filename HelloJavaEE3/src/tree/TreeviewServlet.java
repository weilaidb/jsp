package tree;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import tree.*;

public class TreeviewServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		String parentID = request.getParameter("parent");//获得id的值
		if (parentID!=null&&!parentID.equals(""))//如果不为null和空
		{
			Category category = new Category(Integer.parseInt(parentID));//创建Category对象
			TreeviewElement[] top =  category.getChildren();//得到该分类的所有下级分类
			response.setContentType("text/html");
			java.io.PrintWriter out = response.getWriter();
			for(int i= 0;i<top.length;i++)//循环显示每个分类
			     out.println(treeviewRender.renderTreeViewAjax(top[i],false));
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		doPost(request, response);
	}

}
