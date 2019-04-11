package com.login;

public class DAOFactory {
    public static IUserDAO getIUSerDAOInstance() {
        return new UserDAOProxy();
    }
}
