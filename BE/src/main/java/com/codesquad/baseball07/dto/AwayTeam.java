package com.codesquad.baseball07.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AwayTeam {

    private String name;

    List<Integer> result;
}
