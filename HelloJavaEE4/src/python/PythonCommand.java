package python;

import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;

import java.io.FileInputStream;
import java.io.InputStream;

public class PythonCommand {
    public static void main(String[] args) {
//        System.setProperty("python.home","D:\\jython2.7.0");
        PythonInterpreter interp = new PythonInterpreter();
        // 执行Python程序语句
        interp.exec("import sys");
        interp.set("a", new PyInteger(42));
        interp.exec("print a");
        interp.exec("x = 2+2");
        PyObject x = interp.get("x");
        System.out.println("x: " + x);
    }

    public static String calcResult(String express)
    {
        PythonInterpreter interp = new PythonInterpreter();
        // 执行Python程序语句
        interp.exec("import sys");
        String result = null;
        PyObject pyobj = null;
        try {
            pyobj  =  interp.eval(express);
            result = pyobj.toString();
        }catch (Exception e)
        {
//            e.printStackTrace();
            result=e.getMessage();
        }
        finally {
            interp.cleanup();
            interp.close();
        }
        return result;
    }


     public static String execFilePy(String filename)
     {
         PythonInterpreter interpreter = new PythonInterpreter();
        //执行Python脚本文件
         try {
             InputStream filepy = new FileInputStream(filename);
             interpreter.execfile(filepy);
             filepy.close();
         } catch (Exception e) {
             e.printStackTrace();
         }finally {
             interpreter.cleanup();
             interpreter.close();
         }
         return "";
     }




}