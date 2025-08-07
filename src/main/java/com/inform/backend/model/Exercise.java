package com.inform.backend.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "exercises")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String contractionPic;

    private String extensionPic;

    @Enumerated(EnumType.STRING)
    @Column(name = "muscle_group")
    private MuscleGroup group;

    @Enumerated(EnumType.STRING)
    private ExerciseType type;

    @OneToMany(mappedBy = "exercise", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private List<PlanExercise> planExercises = new ArrayList<>();

    public enum MuscleGroup {
        CHEST, BACK, LEGS, ARMS, SHOULDERS
    }

    public enum ExerciseType {
        FREE_WEIGHT, MACHINE, NO_WEIGHTS, CALISTHENICS
    }
}

