package com.codesquad.baseball07.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.StringJoiner;

public class User {

    @JsonProperty("login")
    private String id;

    public String getId() {
        return id;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", User.class.getSimpleName() + "[", "]")
                .add("id='" + id + "'")
                .toString();
    }
}
