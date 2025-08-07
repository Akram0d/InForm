package com.inform.backend.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "nutrition")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Nutrition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private int calories;

    private double protein;
    private double carb;
    private double fat;

    @Column(name = "pic_url")
    private String picUrl;

    @Enumerated(EnumType.STRING)
    private NutritionType type;

    @Column(columnDefinition = "TEXT")
    private String description;

    public enum NutritionType {
        MEAL, SNACK, SUPPLEMENT
    }


}
