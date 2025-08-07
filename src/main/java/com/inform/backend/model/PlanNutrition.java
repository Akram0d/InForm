package com.inform.backend.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "plan_nutrition")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlanNutrition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "plan_id", nullable = false)
    @JsonIgnore
    private Plan plan;

    @ManyToOne
    @JoinColumn(name = "nutrition_id", nullable = false)
    private Nutrition nutrition;

    private String day;

    @Enumerated(EnumType.STRING)
    private PreferredTime preferredTime;

    private Double quantity;

    @Column(columnDefinition = "TEXT")
    private String notes;

    public enum PreferredTime {
        MORNING, AFTERNOON, NIGHT, PRE_WORKOUT, POST_WORKOUT, FREE
    }
}
