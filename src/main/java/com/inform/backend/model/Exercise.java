package com.inform.backend.model;


import jakarta.persistence.*;
import lombok.*;

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
    private MuscleGroup group;

    @Enumerated(EnumType.STRING)
    private ExerciseType type;

    public enum MuscleGroup {
        CHEST, BACK, LEGS, ARMS, SHOULDERS
    }

    public enum ExerciseType {
        FREE_WEIGHT, MACHINE, NO_WEIGHTS, CALISTHENICS
    }
}

