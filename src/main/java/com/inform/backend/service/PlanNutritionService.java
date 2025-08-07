package com.inform.backend.service;

import com.inform.backend.dto.PlanNutritionRequest;
import com.inform.backend.model.Nutrition;
import com.inform.backend.model.Plan;
import com.inform.backend.model.PlanNutrition;
import com.inform.backend.repository.NutritionRepository;
import com.inform.backend.repository.PlanNutritionRepository;
import com.inform.backend.repository.PlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanNutritionService {

    private final PlanNutritionRepository planNutritionRepository;
    private final PlanRepository planRepository;
    private final NutritionRepository nutritionRepository;

    @Autowired
    public PlanNutritionService(
            PlanNutritionRepository planNutritionRepository,
            PlanRepository planRepository,
            NutritionRepository nutritionRepository
    ) {
        this.planNutritionRepository = planNutritionRepository;
        this.planRepository = planRepository;
        this.nutritionRepository = nutritionRepository;
    }

    public List<PlanNutrition> getPlanNutritions(Long planId) {
        return planNutritionRepository.findByPlanId(planId);
    }

    public PlanNutrition addNutritionToPlan(PlanNutritionRequest request) {
        Plan plan = planRepository.findById(request.getPlanId())
                .orElseThrow(() -> new RuntimeException("Plan not found"));
        Nutrition nutrition = nutritionRepository.findById(request.getNutritionId())
                .orElseThrow(() -> new RuntimeException("Nutrition not found"));

        PlanNutrition planNutrition = new PlanNutrition();
        planNutrition.setPlan(plan);
        planNutrition.setNutrition(nutrition);
        planNutrition.setDay(request.getDay());
        planNutrition.setPreferredTime(request.getPreferredTime());
        planNutrition.setQuantity(request.getQuantity());
        planNutrition.setNotes(request.getNotes());

        return planNutritionRepository.save(planNutrition);
    }



    public void deleteNutritionFromPlan(Long planNutritionId) {
        planNutritionRepository.deleteById(planNutritionId);
    }
}
