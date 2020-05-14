package com.codesquad.baseball07.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.StringJoiner;

public class GithubToken {

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("token_type")
    private String tokenType;

    @JsonProperty("scope")
    private String scope;

    public String getAccessToken() {
        return accessToken;
    }

    public String getTokenType() {
        return tokenType;
    }

    public String getScope() {
        return scope;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", GithubToken.class.getSimpleName() + "[", "]")
                .add("accessToken='" + accessToken + "'")
                .add("tokenType='" + tokenType + "'")
                .add("scope='" + scope + "'")
                .toString();
    }
}
