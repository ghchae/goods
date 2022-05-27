package com.portfolio.goods.dao;

import com.portfolio.goods.domain.User;

import java.util.List;

public interface UserDao {
    List<User> selectUser();

    User selectOneUserById(User user);

    User selectOneUserByPhoneNum(User user);

    int insertUser(User user);

    int deleteAllUser();
}
