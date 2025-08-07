package com.inform.backend.service;

import com.inform.backend.model.Nutrition;
import com.inform.backend.repository.NutritionRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NutritionService {

    private final NutritionRepository nutritionRepository;

    public NutritionService(NutritionRepository nutritionRepository) {
        this.nutritionRepository = nutritionRepository;
    }

    public Page<Nutrition> getAllNutrition(Pageable pageable) {
        Page<Nutrition> nutritionPage = nutritionRepository.findAll(pageable);

        // Optionally trim name/description
        nutritionPage.getContent().forEach(nutrition -> {
            nutrition.setName(nutrition.getName().trim());
            nutrition.setDescription(nutrition.getDescription().trim());
        });

        return nutritionPage;
    }



    public Optional<Nutrition> getNutritionById(Long id) {
        return nutritionRepository.findById(id);
    }

    public List<Nutrition> getByType(Nutrition.NutritionType type) {
        List<Nutrition> nutritions = nutritionRepository.findByType(type);
        for (Nutrition nutrition : nutritions) {
            nutrition.setName(nutrition.getName().trim());
            nutrition.setDescription(nutrition.getDescription().trim());
        }
        return nutritions;
    }

    public Nutrition addNutrition(Nutrition nutrition) {
        return nutritionRepository.save(nutrition);
    }

    public void deleteNutrition(Long id) {
        nutritionRepository.deleteById(id);
    }
}
