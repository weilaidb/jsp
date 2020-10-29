package base;

public class CStringPub {
    public static boolean isTrimEmpty(String string)
    {
        if(null == string)
        {
            string = "";
            return true;
        }
        return string.trim().isEmpty();
    }

    public static String ifNullSetEmpty(String string)
    {
        if(null == string)
        {
            string = "";
        }
        return string.trim();
    }

}
