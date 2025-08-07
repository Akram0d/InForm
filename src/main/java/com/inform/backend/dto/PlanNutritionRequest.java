package com.inform.backend.dto;

import com.inform.backend.model.PlanNutrition;

public class PlanNutritionRequest {
    private Long planId;
    private Long nutritionId;
    private String day;
    private PlanNutrition.PreferredTime preferredTime;
    private Double quantity;
    private String notes;

    public PlanNutritionRequest() {
        super();
    }
    public Long getPlanId() {
        return planId;
    }
    public void setPlanId(Long planId) {
        this.planId = planId;
    }
    public Long getNutritionId() {
        return nutritionId;
    }
    public void setNutritionId(Long nutritionId) {
        this.nutritionId = nutritionId;
    }
    public String getDay() {
        return day;
    }
    public void setDay(String day) {
        this.day = day;
    }
    public PlanNutrition.PreferredTime getPreferredTime() {
        return preferredTime;
    }
    public void setPreferredTime(PlanNutrition.PreferredTime preferredTime) {
        this.preferredTime = preferredTime;
    }
    public Double getQuantity() {
        return quantity;
    }
    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }
    public String getNotes() {
        return notes;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }


}

