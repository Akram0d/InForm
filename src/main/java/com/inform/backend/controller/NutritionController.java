package com.inform.backend.controller;

import com.inform.backend.model.Nutrition;
import com.inform.backend.service.NutritionService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/nutrition")
@CrossOrigin
public class NutritionController {

    private final NutritionService nutritionService;

    public NutritionController(NutritionService nutritionService) {
        this.nutritionService = nutritionService;
    }

    @GetMapping
    public Page<Nutrition> getAllNutrition(
            @PageableDefault(page = 0, size = 10, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {
        return nutritionService.getAllNutrition(pageable);
    }



    @GetMapping("/{id}")
    public ResponseEntity<Nutrition> getNutritionById(@PathVariable Long id) {
        return nutritionService.getNutritionById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/type/{type}")
    public List<Nutrition> getNutritionByType(@PathVariable Nutrition.NutritionType type) {
        return nutritionService.getByType(type);
    }

    @PostMapping
    public ResponseEntity<Nutrition> addNutrition(@RequestBody Nutrition nutrition) {
        return ResponseEntity.ok(nutritionService.addNutrition(nutrition));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteNutrition(@PathVariable Long id) {
        nutritionService.deleteNutrition(id);
        return ResponseEntity.noContent().build();
    }
}
