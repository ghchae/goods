package com.portfolio.goods.service;

import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.ResultObject;
import com.portfolio.goods.domain.User;
import org.springframework.stereotype.Service;

public interface UserService {
    ResultMessage joinUser (User user);
    ResultObject checkUserInfo(User user);
}
