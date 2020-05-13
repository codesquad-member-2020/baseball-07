package com.codesquad.baseball07.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ResultDto {

    private Pitcher pitcher;

    private Hitter hitter;

    private int inning;

    private String turn;

    private String pitchResult;

    private boolean out;
}
