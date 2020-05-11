package com.codesquad.baseball07.service;

import com.codesquad.baseball07.dao.UserDao;
import com.codesquad.baseball07.dto.GithubToken;
import com.codesquad.baseball07.dto.User;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.crypto.SecretKey;

@Service
public class LoginService {

    @Autowired
    private UserDao userDao;

    private final RestTemplate restTemplate;

    @Value("${clientId}")
    private String CLIENT_ID;

    @Value("${clientSecret}")
    private String CLIENT_SECRET;

    @Value("${jwtSecret}")
    private String JWT_SECRET;

    @Value("${redirectUri}")
    private String REDIRECT_URI;

    public LoginService(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public Boolean isValidAuthToken(String jwtToken) {
        String userId = Jwts.parserBuilder().setSigningKey(Keys.hmacShaKeyFor(JWT_SECRET.getBytes())).build().parseClaimsJws(jwtToken).getBody().getId();
        return isExistUser(userId);
    }

    public String authenticate(String code) {
        GithubToken token = this.getToken(code);
        String userId = this.getUserId(token);
        Boolean isExistUser = userDao.isExists(userId);
        if (!isExistUser) {
            this.join(userId);
        }
        return generateJwtToken(userId);
    }

    private Boolean isExistUser(String userId) {
        return userDao.isExists(userId);
    }

    private String generateJwtToken(String userId) {
        SecretKey key = Keys.hmacShaKeyFor(JWT_SECRET.getBytes());
        return Jwts.builder().setId(userId).signWith(key).compact();
    }

    private void join(String userId) {
        userDao.createUser(userId);
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
        String url = String.format("https://github.com/login/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s", CLIENT_ID, CLIENT_SECRET, REDIRECT_URI, code);
        GithubToken githubToken = this.restTemplate.getForObject(url, GithubToken.class);
        return githubToken;
    }
}
