package com.portfolio.goods.controller;

import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.User;
import com.portfolio.goods.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    private UserService userService;

    @GetMapping("/memberInsert")
    public String memberInsert() {
        return "register/registerForm";
    }

    @GetMapping("/registerConfirm")
    public String registerConfirm() {
        return "register/registerConfirm";
    }

    @PostMapping("/memberInsert")
    public @ResponseBody ResultMessage memberInsert(@RequestBody User user) {
        return userService.joinUser(user);
    }
}
