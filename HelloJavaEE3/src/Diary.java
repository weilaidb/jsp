import com.commmon.ConverFromGBKToUTF8;
import com.commmon.SqlInterface;
import com.encoding.EncodeUtil;
import com.sun.org.apache.xerces.internal.xs.StringList;
import weilaidb.sql.SqlProc;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * �ռǱ�����¼ÿ����ռ���Ϣ
 */
public class Diary extends HttpServlet {

    private String message;

    @Override
    public void init() throws ServletException {
        message = "Hello world, this message is from servlet!" +
                "so nice things!!";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //������Ӧ��������
        response.setContentType("text/html;charset=utf-8");

        //�����߼�ʵ��
        PrintWriter out = response.getWriter();

/**
 * ���ı��������
 * �ļ���GBK��UTF-8��ʽ���뵽�ڴ棬����UTF-16��.class�ļ���ִ��ʱ�ٽ����UTF-16�ĵ��ڴ��У���ӡʱ��
 * ʹ��ϵͳ��������ӡ
 * �����ļ�������GBKʱ��ʹ��ANSIʱ�������ʹ��GBK���
 * �ļ�������UTF-8ʱ��ʹ��GBK�����������������
 * ��������������ʱ�����ļ���ʽ�ı�һ�¡�
 */
        String gbkstr = "�ô�һ����  \n";

        for (int i = 0; i < 1; i++) {
            out.println("<h1>" + message + (gbkstr) +"</h1>");
        }

        /**
         * ��ȡ"�ռ�:"��ʼ�����ݿ���Ϣ
         */
//        SqlProc.getDbNameEps()
        String queryData = "�ռ�:";
        List<String> showlist = new ArrayList();
        String result = "";
        try {
            result = SqlProc.queryData(SqlProc.getDbnameAlldb(), SqlProc.getTablenameAbc(),
                    queryData, showlist);
            System.out.println("result count:" + showlist.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        out.println(showlist.size());
        out.write(result + "</br>");

        for (Integer j = 0; j < showlist.size() ; j++) {
            out.write("=========================</br>");
            out.write(j.toString() + ":" + showlist.get(j) + "</br>");
        }

        response.getWriter().flush();
        try {
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
