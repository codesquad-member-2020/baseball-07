package com.codesquad.baseball07.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class HitterHistoryDto {

    private int inning;

    private History histories;

}
