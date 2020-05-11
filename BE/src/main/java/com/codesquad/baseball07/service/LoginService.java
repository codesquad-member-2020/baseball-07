package com.codesquad.baseball07.service;

import com.codesquad.baseball07.dao.UserDao;
import com.codesquad.baseball07.dto.GithubToken;
import com.codesquad.baseball07.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class LoginService {

    @Autowired
    private UserDao userDao;

    private final RestTemplate restTemplate;

    public LoginService(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public Boolean isExistUser(String email) {
        return userDao.isExists(email);
    }

    private String getUserId(GithubToken githubToken) {
        String url = "https://api.github.com/user";
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.AUTHORIZATION, String.format("%s %s", githubToken.getTokenType(), githubToken.getAccessToken()));
        HttpEntity request = new HttpEntity(headers);
        ResponseEntity<User> response = restTemplate.exchange(url, HttpMethod.GET, request, User.class);

        return response.getBody().getId();
    }

    private GithubToken getToken(String code) {
        String url = "https://github.com/login/oauth/access_token?client_id=47a4d1cd4bb8a7e40f49&client_secret=afd20e493072956c324b366a3e774a79fa979394&redirect_uri=http://localhost:8080/login&code=" + code;
        GithubToken githubToken = this.restTemplate.getForObject(url, GithubToken.class);
        return githubToken;
    }

    public String join(String code) {
        GithubToken token = this.getToken(code);
        String userId = this.getUserId(token);
        Boolean isExistUser = userDao.isExists(userId);
        if (!isExistUser) {
            userDao.createUser(userId);
        }
        return "";
    }
}
