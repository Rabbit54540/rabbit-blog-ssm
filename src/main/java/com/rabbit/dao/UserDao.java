package com.rabbit.dao;

import com.rabbit.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    void addUser(User user);

    User selectUserByUserName(String username);

    String selectPasswordByUserName(String userName);
}
