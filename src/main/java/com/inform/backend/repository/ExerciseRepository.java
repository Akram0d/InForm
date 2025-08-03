package com.inform.backend.repository;


import com.inform.backend.model.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExerciseRepository extends JpaRepository<Exercise, Long> {
    List<Exercise> findByGroup(Exercise.MuscleGroup group);
    List<Exercise> findByType(Exercise.ExerciseType type);
}
