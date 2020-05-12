package com.codesquad.baseball07.entity;

import lombok.*;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Player {

    @Id
    private Long id;

    private int matchOrder;

    private String position;

    private String name;

    private List<PitchingRecord> pitchingRecords = new ArrayList<>();

    public Player(int order, String position, String name) {
        this.matchOrder = order;
        this.position = position;
        this.name = name;
    }

    public void addPitchingRecord(Ball ball, int inning, String turn, int ballCount, int turnAtBatCount, int hitCount, boolean strikeOut) {
        PitchingRecord record = new PitchingRecord(ball.getId(), inning, turn, ballCount, turnAtBatCount, hitCount, strikeOut);
        pitchingRecords.add(record);
    }

    public void cleanPitchingRecord() {
        pitchingRecords.clear();
    }
}
