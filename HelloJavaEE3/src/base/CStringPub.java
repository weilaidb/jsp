package base;

public class CStringPub {
    public static String ifNullSetEmpty(String string)
    {
        if(null == string)
        {
            string = "";
        }
        return string;
    }
}
