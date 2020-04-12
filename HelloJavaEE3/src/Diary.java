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
 * 日记本，记录每天的日记信息
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
        //设置响应内容类型
        response.setContentType("text/html;charset=utf-8");

        //设置逻辑实现
        PrintWriter out = response.getWriter();

/**
 * 中文编码的问题
 * 文件以GBK或UTF-8格式读入到内存，编码UTF-16的.class文件，执行时再解码成UTF-16的到内存中，打印时，
 * 使用系统编码来打印
 * 所以文件编码是GBK时，使用ANSI时，输出则使用GBK输出
 * 文件编码是UTF-8时，使用GBK输出，则有乱码现象。
 * 所以有这种问题时，将文件格式改变一下。
 */
        String gbkstr = "好大一棵树  \n";

        for (int i = 0; i < 1; i++) {
            out.println("<h1>" + message + (gbkstr) +"</h1>");
        }

        /**
         * 获取"日记:"开始的数据库信息
         */
//        SqlProc.getDbNameEps()
        String queryData = "日记:";
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
