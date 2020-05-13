package com.codesquad.baseball07.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EntryDto {

    private String result;

    public EntryDto(boolean valid) {
        if (valid) {
            this.result = "ok";
        } else {
            this.result = "fail";
        }
    }
}
