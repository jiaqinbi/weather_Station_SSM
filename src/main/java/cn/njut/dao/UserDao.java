package cn.njut.dao;

import cn.njut.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户Dao接口
 * @author Bijiaqin
 * @date 2019/6/28 11:06
 */
@Repository
public interface UserDao {
    //查询用户，可用作登陆
    @Select("select * from user where username=#{username} and password=#{password}")
    public List<User> findUser(User user);

    @Select("select * from user")
    public List<User> findAllUser();

    //注册用户，此项目无需实现
    @Insert("insert into user(username, password) values(#{username},#{password})")
    public void registerUser(User user);
}
