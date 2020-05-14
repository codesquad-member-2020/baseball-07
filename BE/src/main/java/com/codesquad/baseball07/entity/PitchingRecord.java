package com.codesquad.baseball07.entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PitchingRecord {

    private Long ball;

    private int inning;

    private String turn;

    private int ballCount;

    private int turnAtBatCount;

    private int hitCount;

    private boolean strikeOut;

    public PitchingRecord(Long ballId) {
        this.ball = ballId;
    }

    public PitchingRecord(Long ball, Integer inning, String turn, Integer ball_count, Integer turn_at_bat_count, Integer hit_count, Boolean strike_out) {
        this.ball = ball;
        this.inning = inning;
        this.turn =turn;
        this.ballCount = ball_count;
        this.turnAtBatCount =turn_at_bat_count;
        this.hitCount = hit_count;
        this.strikeOut = strike_out;
    }

    public PitchingRecord(long ball, int inning, String turn, int ball_count, int turn_at_bat_count, int hit_count, boolean strike_out) {
        this.ball = ball;
        this.inning = inning;
        this.turn =turn;
        this.ballCount = ball_count;
        this.turnAtBatCount =turn_at_bat_count;
        this.hitCount = hit_count;
        this.strikeOut = strike_out;
    }
}
