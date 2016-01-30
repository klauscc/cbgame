package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.User;
import com.chubao.cf.game.repository.mapper.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/29 下午7:03
 * 任务号:
 * 创建说明:
 */
@Service
public class UserService implements IUserService{

    private final static String salt = "fsbfiweoh239eofbdsjl/42";

    @Autowired
    private IUserDao userDao;
    @Autowired
    private HttpSession session;

    @Override
    public ArrayList<User> getAllUsers() {
        return (ArrayList<User>) userDao.getAllUsers();
    }

    @Override
    public User getUser(Integer userId) {
        return userDao.getUser(userId);
    }

    @Override
    public void addUser(User user) {
        user.setTimeAdded(new Date());
        user.setPassword(passwordDigest(user.getPassword()));
        userDao.addUser(user);
    }

    @Override
    public void disableUser(Integer userId) {
        userDao.disableUser(userId);
    }

    @Override
    public void editUser(User user) {
        user.setPassword(passwordDigest(user.getPassword()));
        userDao.editUser(user);
    }

    @Override
    public User login(String userName, String password) {
        User user = userDao.login(userName,passwordDigest(password));
        if(null == user || !user.getEnabled()){
            return null;
        }
        if("ADMIN".equals(user.getAuthority())){
            session.setAttribute("adminUserId",user.getUserId());
        } else {
            session.setAttribute("userId",user.getUserId());
        }
        return user;
    }

    @Override
    public Boolean validateIdCard(String idCard) {
        int[] weight = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};    //十七位数字本体码权重
        char[] validate = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};

        if (idCard.length() != 18) {
            return false;
        }
        int sum = 0;
        int mode = 0;
        for (int i = 0; i < idCard.length() - 1; i++) {
            sum = sum + Integer.parseInt(String.valueOf(idCard.charAt(i))) * weight[i];
        }
        mode = sum % 11;
        if(validate[mode] != 'X'){
            return validate[mode] == idCard.charAt(17);
        }else {
            return ('x'==idCard.charAt(17) || 'X'==idCard.charAt(17));
        }
    }

    @Override
    public Boolean checkIfRegistered(String type, String value) {
        if("idCard".equals(type) || "email".equals(type) || "tel".equals(type)){
            User user = userDao.checkIfRegisterd(type,value);
            if(null == user){
                return false;
            }
        }
        return true;
    }

    @Override
    public Boolean checkUser(User user) {
        if(!validateIdCard(user.getIdCard())){
            return false;
        }
        return true;
    }

    public String passwordDigest(String password){
        return DigestUtils.md5DigestAsHex((password + salt).getBytes());
    }

}
