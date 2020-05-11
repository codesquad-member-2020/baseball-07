package com.codesquad.baseball07.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PitchingRecord {

    private Long Ball;

    private int inning;

    private String turn;

    private int count;

    public PitchingRecord(Long action) {
        this.Ball = action;
    }

    @Override
    public String toString() {
        return "PitchingRecord{" +
                "ball=" + Ball +
                ", inning=" + inning +
                ", turn='" + turn + '\'' +
                ", count=" + count +
                '}';
    }
}
