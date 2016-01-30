package com.chubao.cf.game.repository.mapper;

import com.chubao.cf.game.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/29 下午6:46
 * 任务号:
 * 创建说明:
 */
public interface IUserDao {

    /**
     * 获取所有用户
     * @return 所有用户
     */
    List<User> getAllUsers();

    /**
     * 获取用户
     * @param userId
     * @return 用户
     */
    User getUser(Integer userId);

    /**
     * 添加用户
     * @param user 用户
     */
    void addUser(User user);

    /**
     * 注销用户
     * @param userId 用户id
     */
    void disableUser(Integer userId);

    /**
     * 编辑用户
     * @param user 用户
     */
    void editUser(User user);

    /**
     * 登陆，成功返回登陆的用户
     * @param userName 用户名
     * @param password 密码
     * @return 登陆的用户
     */
    User login(String userName, String password);

    /**
     * 检查是否被注册
     * @param type 类型: email ，tel , idCard
     * @param value 值
     * @return 返回被注册的用户，否则返回null
     */
    User checkIfRegisterd(@Param("type")String type, @Param("value")String value);

    /**
     * 修改密码
     * @param userId 用户id
     * @param newPassword 新密码
     */
    void changePassword(Integer userId,String newPassword);
}
