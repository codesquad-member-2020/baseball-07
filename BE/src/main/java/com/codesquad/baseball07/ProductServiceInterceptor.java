package com.codesquad.baseball07;

import com.codesquad.baseball07.service.LoginService;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class ProductServiceInterceptor implements HandlerInterceptor {

    private final LoginService loginService;

    public ProductServiceInterceptor(LoginService loginService) {
        this.loginService = loginService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        Cookie[] cookies = request.getCookies();
        String cookieName = "auth-token";
        String cookieValue = null;

        if (cookies == null) {
            return false;
        }

        for (Cookie cookie : cookies) {
            if (cookieName.equals(cookie.getName())) {
                cookieValue = cookie.getValue();
            }
        }
        return loginService.isValidAuthToken(cookieValue);
    }
}
