package com.codesquad.baseball07.dto;

import java.util.StringJoiner;

public class PlayerDto {

    private String name;

    private Integer batCount;

    private Integer outCount;

    private Integer hitCount;

    private Float average;


    public PlayerDto() {}

    public PlayerDto(String name, Integer batCount, Integer outCount, Integer hitCount, Float average) {
        this.name = name;
        this.batCount = batCount;
        this.outCount = outCount;
        this.hitCount = hitCount;
        this.average = average;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBatCount() {
        return batCount;
    }

    public void setBatCount(Integer batCount) {
        this.batCount = batCount;
    }

    public Integer getOutCount() {
        return outCount;
    }

    public void setOutCount(Integer outCount) {
        this.outCount = outCount;
    }

    public Integer getHitCount() {
        return hitCount;
    }

    public void setHitCount(Integer hitCount) {
        this.hitCount = hitCount;
    }

    public Float getAverage() {
        return average;
    }

    public void setAverage(Float average) {
        this.average = average;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", PlayerDto.class.getSimpleName() + "[", "]")
                .add("name='" + name + "'")
                .add("batCount=" + batCount)
                .add("outCount=" + outCount)
                .add("hitCount=" + hitCount)
                .add("average=" + average)
                .toString();
    }
}
