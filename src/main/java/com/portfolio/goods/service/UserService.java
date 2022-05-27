package com.portfolio.goods.service;

import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.User;
import org.springframework.stereotype.Service;

public interface UserService {
    ResultMessage joinUser (User user);

    ResultMessage checkUserInfo(User user);
}
