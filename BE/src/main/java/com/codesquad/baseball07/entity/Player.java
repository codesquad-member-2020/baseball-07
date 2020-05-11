package com.codesquad.baseball07.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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

    public void addPitchingRecord(Ball ball, int inning, String turn, int count) {
        PitchingRecord record = new PitchingRecord(ball.getId(), inning, turn, count);
        pitchingRecords.add(record);
    }

    public void cleanPitchingRecord() {
        pitchingRecords.clear();
    }

    @Override
    public String toString() {
        return "Player{" +
                "id=" + id +
                ", matchOrder=" + matchOrder +
                ", position='" + position + '\'' +
                ", name='" + name + '\'' +
                ", pitchingRecords=" + pitchingRecords +
                '}';
    }
}
