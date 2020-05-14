package com.codesquad.baseball07.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EachInningScore {

    private HomeTeam homeTeam;

    private AwayTeam awayTeam;
}
