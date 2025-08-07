package com.inform.backend.dto;

public class CreatePlanRequest {
    private String name;
    private Long userId;


    // Getters
    public String getName() {
        return name;
    }

    public Long getUserId() {
        return userId;
    }

    // Setters
    public void setName(String name) {
        this.name = name;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}