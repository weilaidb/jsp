package test;

import java.util.Iterator;
import java.util.TreeSet;

public class TestTreeSet {
    public static void main(String [] args)
    {
        TreeSet ts=new TreeSet();
        ts.add("orange");
        ts.add("apple");
        ts.add("banana");
        ts.add("grape");
        Iterator it=ts.iterator();
        while(it.hasNext())
        {
            String fruit=(String)it.next();
            System.out.println(fruit);
        }
        ts.remove("apple");
        System.out.println(ts);
    }
}
