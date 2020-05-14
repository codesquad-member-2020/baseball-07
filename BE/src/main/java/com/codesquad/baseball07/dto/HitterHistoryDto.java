package com.codesquad.baseball07.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class HitterHistoryDto {

    private int inning;

    private String turn;

    private String hitter;

    private int hitterOrder;

    private List<String> pitchResults;

}
