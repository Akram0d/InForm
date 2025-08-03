package com.inform.backend.controller;


import com.inform.backend.model.Exercise;
import com.inform.backend.service.ExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/exercises")
@CrossOrigin(origins = "*")
public class ExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping
    public List<Exercise> getAllExercises() {
        return exerciseService.getAllExercises();
    }

    @GetMapping("/{id}")
    public Optional<Exercise> getExerciseById(@PathVariable Long id) {
        return exerciseService.getExerciseById(id);
    }

    @PostMapping
    public Exercise createExercise(@RequestBody Exercise exercise) {
        return exerciseService.createExercise(exercise);
    }

    @DeleteMapping("/{id}")
    public void deleteExercise(@PathVariable Long id) {
        exerciseService.deleteExercise(id);
    }

    @GetMapping("/group/{group}")
    public List<Exercise> getByGroup(@PathVariable Exercise.MuscleGroup group) {
        return exerciseService.getByGroup(group);
    }

    @GetMapping("/type/{type}")
    public List<Exercise> getByType(@PathVariable Exercise.ExerciseType type) {
        return exerciseService.getByType(type);
    }
}
