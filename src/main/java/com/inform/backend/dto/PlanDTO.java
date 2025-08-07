package com.inform.backend.dto;

import com.inform.backend.model.Plan;

import java.time.LocalDate;

public class PlanDTO {
    private Long id;
    private String name;
    private Plan.PlanType type;
    private LocalDate createdAt;

    public PlanDTO() {}

    public PlanDTO(Long id, String name, Plan.PlanType type, LocalDate createdAt) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type.toString();
    }

    public String getCreatedAt() {
        return createdAt.toString();
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(Plan.PlanType type) {
        this.type = type;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }
}
