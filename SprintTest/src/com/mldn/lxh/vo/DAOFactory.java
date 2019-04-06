package com.mldn.lxh.vo;

public class DAOFactory {
    public static IEmpDAO getIEmpDAOInstance() throws Exception {
        return new IEmpDAOProxy();
    }
}
