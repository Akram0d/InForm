package com.inform.backend.dto;

public class AddExerciseToPlanRequest {

    private Long planId;
    private Long exerciseId;
    private String day;
    private int sets;
    private int reps;
    private String notes;

    public AddExerciseToPlanRequest() {
    }

    public AddExerciseToPlanRequest(Long planId, Long exerciseId, String day, int sets, int reps, String notes) {
        this.planId = planId;
        this.exerciseId = exerciseId;
        this.day = day;
        this.sets = sets;
        this.reps = reps;
        this.notes = notes;
    }

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    public Long getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(Long exerciseId) {
        this.exerciseId = exerciseId;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public int getSets() {
        return sets;
    }

    public void setSets(int sets) {
        this.sets = sets;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}

