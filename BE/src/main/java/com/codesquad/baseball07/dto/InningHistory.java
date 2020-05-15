package com.codesquad.baseball07.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class InningHistory {

    private int ball;

    private int strike;

    private int hit;

    private int out;
}
