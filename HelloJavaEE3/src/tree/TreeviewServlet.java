package tree;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import tree.*;

public class TreeviewServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		String parentID = request.getParameter("parent");//���id��ֵ
		if (parentID!=null&&!parentID.equals(""))//�����Ϊnull�Ϳ�
		{
			Category category = new Category(Integer.parseInt(parentID));//����Category����
			TreeviewElement[] top =  category.getChildren();//�õ��÷���������¼�����
			response.setContentType("text/html");
			java.io.PrintWriter out = response.getWriter();
			for(int i= 0;i<top.length;i++)//ѭ����ʾÿ������
			     out.println(treeviewRender.renderTreeViewAjax(top[i],false));
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		doPost(request, response);
	}

}
