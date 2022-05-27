package com.portfolio.goods.repository;

import com.portfolio.goods.dao.UserDao;
import com.portfolio.goods.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;/* 직접 적어줘야한다.*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})//xml 설정파일 위치를 지정
public class UserDaoImplTest {

    @Autowired
    UserDao userDao;

    @Test
    public void selectOneUserById() {
        User user = new User();
        user.setUserId("tester");
        assertTrue(userDao.selectOneUserById(user) != null);
    }

    @Test
    public void insertUser() {
        User user = new User("tester", "홍길동", "1234", "920101", "test@test.com", "0102324323");
        System.out.println(user);
        int result = userDao.insertUser(user);
        assertEquals(result, 1);
    }

    @Test
    public void selectUser() {
        List<User> list = userDao.selectUser();
        for (User user : list) {
            System.out.println(user);
        }
    }

    @Test
    public void deleteAllUser() {
        /* 삭제한 행의 갯수를 반환*/
        assertEquals(userDao.deleteAllUser(), 0);

        userDao.selectUser();
    }

    @Test
    public void selectUserByPhoneNum() {
        User user = new User("tester", "홍길동", "1234", "920101", "test", "010232");
        User user2 = userDao.selectOneUserByPhoneNum(user);
        System.out.println(user2);

    }


}