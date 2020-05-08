package com.codesquad.baseball07.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.StringJoiner;

public class Game {

    private Long id;

    @JsonProperty("home_team")
    private Team homeTeam;

    @JsonProperty("away_team")
    private Team awayTeam;

    public Long getId() {
        return id;
    }

    public Team getHomeTeam() {
        return homeTeam;
    }

    public Team getAwayTeam() {
        return awayTeam;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setHomeTeam(Team homeTeam) {
        this.homeTeam = homeTeam;
    }

    public void setAwayTeam(Team awayTeam) {
        this.awayTeam = awayTeam;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", Game.class.getSimpleName() + "[", "]")
                .add("id=" + id)
                .add("homeTeam=" + homeTeam)
                .add("awayTeam=" + awayTeam)
                .toString();
    }
}
