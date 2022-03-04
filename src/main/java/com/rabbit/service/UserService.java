package com.rabbit.service;

import com.rabbit.pojo.User;

public interface UserService {
    void addUser(User user);

    User selectUserByUserName(String username);

    String selectPasswordByUserName(String userName);

}
