package cn.njut.services.impl;

import cn.njut.dao.UserDao;
import cn.njut.domain.User;
import cn.njut.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层：实现对用户的操作，增删改查等
 * @author Bijiaqin
 * @date 2019/6/28 11:15
 */

@Service("userService")
public class UserServiceImpl /*实现UserService接口类中的方法*/implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findUser(User user) {
        //System.out.println("业务层：查询用户...");
       // System.out.println(user);
       return userDao.findUser(user);
    }

    @Override
    public List<User> findAllUser() {
     //   System.out.println("业务层：查询用户...");
        return userDao.findAllUser();
    }

    @Override
    public void registerUser(User user) {

        userDao.registerUser(user);
    }
}
