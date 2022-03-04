package com.rabbit.service;

import com.rabbit.dao.UserDao;
import com.rabbit.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void addUser(User user) {
        if (user!=null){
            userDao.addUser(user);
        }
    }

    @Override
    public User selectUserByUserName(String username) {
        if (username == null){
            return null;
        }
        return userDao.selectUserByUserName(username);
    }

    @Override
    public String selectPasswordByUserName(String userName) {
        if (userName == null){
            return  null;
        }
        return userDao.selectPasswordByUserName(userName);
    }
}
