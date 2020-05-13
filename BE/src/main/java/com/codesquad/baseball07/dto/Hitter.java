package com.codesquad.baseball07.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class Hitter {

    private String name;

    private int order;

    private int batCount;

    private int hitCount;

}
