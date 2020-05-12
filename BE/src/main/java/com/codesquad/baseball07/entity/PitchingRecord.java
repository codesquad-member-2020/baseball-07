package com.codesquad.baseball07.entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PitchingRecord {

    private Long Ball;

    private int inning;

    private String turn;

    private int ballCount;

    private int turnAtBatCount;

    private int hitCount;

    private boolean strikeOut;

    public PitchingRecord(Long ballId) {
        this.Ball = ballId;
    }

}
