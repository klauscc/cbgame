package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.User;

import java.util.ArrayList;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/29 下午8:35
 * 任务号:
 * 创建说明:
 */
public interface IUserService {

    /**
     * 获取所有用户
     * @return 所有用户
     */
    ArrayList<User> getAllUsers();

    /**
     * 查询用户
     * @param userId 用户id
     */
    User getUser(Integer userId);

    /**
     * 添加用户
     * @param user 用户
     */
    void addUser(User user);

    /**
     * 删除用户
     * @param userId 用户id
     */
    void disableUser(Integer userId);

    /**
     * 编辑用户
     * @param user 用户
     */
    void editUser(User user);

    /**
     * 登陆，成功则返回登陆的user，失败返回null
     * @param userName 用户名
     * @param password 密码
     * @return 用户
     */
    User login(String userName,String password);
    /**
     * 校验身份证是否有效
     * @param idCard 身份证号码
     * @return 是否有效
     */
    Boolean validateIdCard(String idCard);

    /**
     * 传入参数是否被注册
     * @param type 传入参数类型：email,tel,idCard
     * @param value 传入参数值
     * @return 是否注册
     */
    Boolean checkIfRegistered(String type,String value);

    /**
     * 检验user参数是否有效
     * @param user 待添加的用户
     * @return 有效与否
     */
    Boolean checkUser(User user);
}
