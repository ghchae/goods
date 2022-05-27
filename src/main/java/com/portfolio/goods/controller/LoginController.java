package com.portfolio.goods.controller;

import com.portfolio.goods.domain.ResultMessage;
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
    public @ResponseBody ResultMessage login(@RequestBody User user, HttpServletResponse response, HttpServletRequest request) {
        ResultMessage resultMessage = userService.checkUserInfo(user);
        if (resultMessage.isResult()) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());

            Cookie cookie = new Cookie("userId", user.getUserId());
            if (!user.isRememberId()) {
                cookie.setMaxAge(0);
            }
            response.addCookie(cookie);
        }
        return resultMessage;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
