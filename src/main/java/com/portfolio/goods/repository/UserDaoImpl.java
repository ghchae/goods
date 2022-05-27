package com.portfolio.goods.repository;

import com.portfolio.goods.dao.UserDao;
import com.portfolio.goods.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    SqlSession sqlSession;

    String namespace = "com.portfolio.goods.dao.UserMapper.";

    @Override
    public List<User> selectUser() {
        return sqlSession.selectList(namespace + "selectUser");
    }

    @Override
    public User selectOneUserById(User user) {
        return sqlSession.selectOne(namespace + "selectOneUserById", user);
    }

    @Override
    public User selectOneUserByPhoneNum(User user) {
        return sqlSession.selectOne(namespace + "selectOneUserByPhoneNum", user);
    }

    @Override
    public int insertUser(User user) {
        return sqlSession.insert(namespace + "insertUser", user);
    }

    @Override
    public int deleteAllUser() {
        return sqlSession.delete(namespace + "deleteAllUser");
    }
}
