package com.inform.backend.repository;

import com.inform.backend.model.PlanNutrition;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlanNutritionRepository extends JpaRepository<PlanNutrition, Long> {
    List<PlanNutrition> findByPlanId(Long planId);
}
