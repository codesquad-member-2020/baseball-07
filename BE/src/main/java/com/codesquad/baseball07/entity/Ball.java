package com.codesquad.baseball07.entity;

import lombok.*;
import org.springframework.data.annotation.Id;

import java.util.Random;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class Ball {

    @Id
    private Long id;

    private String result;

    public Ball() {
        this.result = randomBall();
    }

    private String randomBall() {
        Random rand = new Random();
        int random = rand.nextInt(4);
        String randomBall = "";
        switch (random) {
            case 0:
                randomBall = "BALL";
                break;
            case 1:
                randomBall = "STRIKE";
                break;
            case 2:
                randomBall = "HIT";
                break;
            case 3:
                randomBall = "OUT";
                break;
        }

        return randomBall;
    }
}
