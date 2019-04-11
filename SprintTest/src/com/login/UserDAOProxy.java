package com.login;

public class UserDAOProxy implements IUserDAO {
    private DatabaseConnection dbc = null;
    private IUserDAO dao = null;

    public UserDAOProxy() {
        try {
            this.dbc = new DatabaseConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.dao = new UserDAOImpl(this.dbc.getConnection());
    }

    public boolean findLogin(User user) throws Exception {
        boolean flag = false;
        try {
            flag = this.dao.findLogin(user);
        } catch (Exception e) {
            throw e;
        } finally {
            this.dbc.close();
        }
        return flag;
    }
}
