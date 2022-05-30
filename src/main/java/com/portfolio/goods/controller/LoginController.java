package com.portfolio.goods.controller;

import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.ResultObject;
import com.portfolio.goods.domain.User;
import com.portfolio.goods.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginForm(HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/";
        }
        return "login/loginForm";
    }

    @PostMapping("/login")
    public @ResponseBody ResultObject login(@RequestBody User user, HttpServletResponse response, HttpServletRequest request) {
        ResultObject resultObject = userService.checkUserInfo(user);
        if (resultObject.isResult()) {
            User loginUser = (User)resultObject.getObject();
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("admin", loginUser.getAdmin());

            Cookie cookie = new Cookie("userId", user.getUserId());
            if (!user.isRememberId()) {
                cookie.setMaxAge(0);
            }
            response.addCookie(cookie);
        }
        return resultObject;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
