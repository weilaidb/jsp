package python;

import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;

public class PythonCommand {
    public static void main(String[] args) {
//        System.setProperty("python.home","D:\\jython2.7.0");
        PythonInterpreter interp = new PythonInterpreter();
        // ÷¥––Python≥Ã–Ú”Ôæ‰
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
        // ÷¥––Python≥Ã–Ú”Ôæ‰
        interp.exec("import sys");
        PyObject result =  interp.eval(express);
        return result.toString();
    }


}
