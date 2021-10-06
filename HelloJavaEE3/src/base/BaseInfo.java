package base;

//import com.sun.deploy.net.HttpRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class BaseInfo {
    static public String path(HttpServletRequest request)
    {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//        System.out.println("path: " + path);
        System.out.println("basePath: " + basePath);
        if(null == basePath)
        {
            return "";
        }
        return basePath;
    }
}
