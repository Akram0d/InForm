package com.inform.backend.controller;

import com.inform.backend.dto.AddExerciseToPlanRequest;
import com.inform.backend.model.PlanExercise;
import com.inform.backend.service.PlanExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/plan-exercises")
public class PlanExerciseController {

    @Autowired
    private PlanExerciseService planExerciseService;

    @PostMapping("/add")
    public ResponseEntity<PlanExercise> addExerciseToPlan(@RequestBody AddExerciseToPlanRequest request) {
        return ResponseEntity.ok(planExerciseService.addExerciseToPlan(request));
    }

    @GetMapping("/{planId}")
    public ResponseEntity<List<PlanExercise>> getExercisesForPlan(@PathVariable Long planId) {
        return ResponseEntity.ok(planExerciseService.getExercisesForPlan(planId));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> removePlanExercise(@PathVariable Long id) {
        planExerciseService.removePlanExercise(id);
        return ResponseEntity.ok("Deleted");
    }
}

