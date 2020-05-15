package com.codesquad.baseball07;

import com.codesquad.baseball07.service.LoginService;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ProductServiceInterceptorAppConfig implements WebMvcConfigurer {

    private final LoginService loginService;

    public ProductServiceInterceptorAppConfig(LoginService loginService) {
        this.loginService = loginService;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new ProductServiceInterceptor(loginService)).addPathPatterns("/games/**");
    }
}
