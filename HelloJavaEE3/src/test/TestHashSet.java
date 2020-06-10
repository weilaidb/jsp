package test;

import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;

public class TestHashSet {
    public static void main(String [] args)
    {
        HashSet h=new HashSet();
        h.add("1st");
        h.add("2nd");
        h.add(new Integer(3));
        h.add(new Double(4.0));
        h.add("2nd");            //重复元素，未被添加
        h.add(new Integer(3));      //重复元素，未被添加
        h.add(new Date());
        System.out.println("开始：size="+h.size());
        Iterator it=h.iterator();
        while(it.hasNext())
        {
            Object o=it.next();
            System.out.println(o);
        }

        h.remove("2nd");
        System.out.println("移除元素后：size="+h.size());
        System.out.println(h);
    }
}
