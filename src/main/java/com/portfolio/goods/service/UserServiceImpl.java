package com.portfolio.goods.service;

import com.portfolio.goods.dao.UserDao;
import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.transform.Result;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public ResultMessage joinUser(User user) {
        if (userDao.selectOneUserById(user) != null) {
            return new ResultMessage(false, "이미 존재하는 아이디입니다.");
        }
        if (userDao.selectOneUserByPhoneNum(user) != null) {
            return new ResultMessage(false, "이미 가입된 회원입니다.");
        }
        userDao.insertUser(user);
        return new ResultMessage(true, "회원 가입을 축하합니다.");
    }

    @Override
    public ResultMessage checkUserInfo(User user) {
        User loginUser = userDao.selectOneUserById(user);
        if (loginUser == null) {
            return new ResultMessage(false, "가입된 아이디가 없습니다.");
        }
        if (!loginUser.getPassword().equals(user.getPassword())){
            return new ResultMessage(false, "비밀번호가 틀렸습니다.");
        }
            return new ResultMessage();
    }
}
