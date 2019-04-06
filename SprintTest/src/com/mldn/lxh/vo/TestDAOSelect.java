package com.mldn.lxh.vo;

import java.util.Iterator;
import java.util.List;

public class TestDAOSelect {
    public static void main(String[] args) throws Exception {
        List<Emp> all = DAOFactory.getIEmpDAOInstance().findAll("");
        Iterator<Emp> iter = all.iterator();
        while (iter.hasNext()) {
            Emp emp = iter.next();
            System.out.print(emp.getEmpno() + "、" +
                    emp.getEname() + "-->"
                    + emp.getEname());
        }
    }
}
