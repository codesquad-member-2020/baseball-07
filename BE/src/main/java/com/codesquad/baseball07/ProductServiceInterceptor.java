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
        String cookieName = loginService.getCookieName();
        String cookieValue = null;

        if (cookies == null) {
            response.sendError(401, "사용자 인증이 필요합니다.");
            return false;
        }

        for (Cookie cookie : cookies) {
            if (cookieName.equals(cookie.getName())) {
                cookieValue = cookie.getValue();
            }
        }
        if(loginService.isValidAuthToken(cookieValue)) {
            return true;
        }
        response.sendError(401, "사용자 인증이 필요합니다.");
        return false;
    }
}
