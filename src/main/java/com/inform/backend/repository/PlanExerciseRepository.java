package com.inform.backend.repository;

import com.inform.backend.model.PlanExercise;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlanExerciseRepository extends JpaRepository<PlanExercise, Long> {
    List<PlanExercise> findByPlanId(Long planId);
}
