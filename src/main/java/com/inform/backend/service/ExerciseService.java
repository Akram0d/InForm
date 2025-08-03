package com.inform.backend.service;


import com.inform.backend.model.Exercise;
import com.inform.backend.repository.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ExerciseService {

    @Autowired
    private ExerciseRepository exerciseRepository;

    public List<Exercise> getAllExercises() {
        return exerciseRepository.findAll();
    }

    public Optional<Exercise> getExerciseById(Long id) {
        return exerciseRepository.findById(id);
    }

    public Exercise createExercise(Exercise exercise) {
        return exerciseRepository.save(exercise);
    }

    public void deleteExercise(Long id) {
        exerciseRepository.deleteById(id);
    }

    public List<Exercise> getByGroup(Exercise.MuscleGroup group) {
        return exerciseRepository.findByGroup(group);
    }

    public List<Exercise> getByType(Exercise.ExerciseType type) {
        return exerciseRepository.findByType(type);
    }
}

