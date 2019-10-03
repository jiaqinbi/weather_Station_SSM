package cn.njut.services;

import cn.njut.domain.User;


import java.util.List;

/**
 * service接口需要手动编写实现类
 * @author Bijiaqin
 * @date 2019/6/28 11:12
 */
public interface UserService {
    //查询用户，可用作登陆
    public List<User> findUser(User user);

    public List<User> findAllUser();

    //注册用户，此项目无需实现
    public void registerUser(User user);
}
