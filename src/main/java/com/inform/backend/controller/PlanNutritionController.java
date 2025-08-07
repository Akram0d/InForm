package com.inform.backend.controller;

import com.inform.backend.dto.PlanNutritionRequest;
import com.inform.backend.model.PlanNutrition;
import com.inform.backend.service.PlanNutritionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/plan-nutritions")
public class PlanNutritionController {

    private final PlanNutritionService planNutritionService;

    @Autowired
    public PlanNutritionController(PlanNutritionService planNutritionService) {
        this.planNutritionService = planNutritionService;
    }

    @GetMapping("/{planId}")
    public ResponseEntity<List<PlanNutrition>> getPlanNutritions(@PathVariable Long planId) {
        List<PlanNutrition> nutritions = planNutritionService.getPlanNutritions(planId);
        return ResponseEntity.ok(nutritions);
    }

    @PostMapping
    public ResponseEntity<PlanNutrition> addNutritionToPlan(@RequestBody PlanNutritionRequest request) {
        PlanNutrition saved = planNutritionService.addNutritionToPlan(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteNutrition(@PathVariable Long id) {
        planNutritionService.deleteNutritionFromPlan(id);
        return ResponseEntity.noContent().build();
    }
}

