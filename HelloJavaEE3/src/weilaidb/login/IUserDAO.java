package weilaidb.login;

public interface IUserDAO {
    /**
     * 用户登陆验证
     * @param user
     * @return 验证的操作结果
     * @throws Exception
     */
    public boolean findLogin(User user) throws Exception;
}
