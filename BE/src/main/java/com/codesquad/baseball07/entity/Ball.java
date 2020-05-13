package com.codesquad.baseball07.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Ball {

    @Id
    private Long id;

    private String result;

    public Ball(String result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "Ball{" +
                "id=" + id +
                ", result='" + result + '\'' +
                '}';
    }
}
