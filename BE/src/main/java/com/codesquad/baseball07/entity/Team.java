package com.codesquad.baseball07.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.relational.core.mapping.MappedCollection;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class Team {
    private Long id;

    private String name;

    @JsonIgnore
    private String position;

    @JsonIgnore
    private Long gameId;

    @MappedCollection(idColumn = "action_id")
    private List<Player> playerList = new ArrayList<>();

    public Team() {
    }

    public Team(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPosition() {
        return position;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", Team.class.getSimpleName() + "[", "]")
                .add("id=" + id)
                .add("name='" + name + "'")
                .add("position='" + position + "'")
                .add("gameId=" + gameId)
                .toString();
    }
}
