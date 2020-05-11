package com.codesquad.baseball07.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GameDto {

    private boolean homeTeamEmpty;

    private String homeTeam;

    private boolean awayTeamEmpty;

    private String awayTeam;

    public GameDto(String splitString) {
        String[] arrayString = splitString.split(",");
        this.homeTeamEmpty = Boolean.parseBoolean(arrayString[0]);
        this.homeTeam = arrayString[1];
        this.awayTeamEmpty = Boolean.parseBoolean(arrayString[2]);
        this.awayTeam = arrayString[3];
    }
}
