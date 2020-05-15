package com.codesquad.baseball07.dto;

import lombok.*;

import java.util.Map;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GameScoreDto {

    private Long id;

    private Map<String, Object> homeTeam;

    private Map<String, Object> awayTeam;
}
