package com.inform.backend.service;

import com.inform.backend.dto.AddExerciseToPlanRequest;
import com.inform.backend.model.Exercise;
import com.inform.backend.model.Plan;
import com.inform.backend.model.PlanExercise;
import com.inform.backend.repository.ExerciseRepository;
import com.inform.backend.repository.PlanExerciseRepository;
import com.inform.backend.repository.PlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanExerciseService {

    @Autowired
    private PlanExerciseRepository planExerciseRepository;

    @Autowired
    private PlanRepository planRepository;

    @Autowired
    private ExerciseRepository exerciseRepository;

    public PlanExercise addExerciseToPlan(AddExerciseToPlanRequest request) {
        Plan plan = planRepository.findById(request.getPlanId())
                .orElseThrow(() -> new RuntimeException("Plan not found"));

        Exercise exercise = exerciseRepository.findById(request.getExerciseId())
                .orElseThrow(() -> new RuntimeException("Exercise not found"));

        PlanExercise pe = new PlanExercise();
        pe.setPlan(plan);
        pe.setExercise(exercise);
        pe.setDay(request.getDay());
        pe.setSets(request.getSets());
        pe.setReps(request.getReps());
        pe.setNotes(request.getNotes());

        return planExerciseRepository.save(pe);
    }

    public List<PlanExercise> getExercisesForPlan(Long planId) {
        return planExerciseRepository.findByPlanId(planId);
    }

    public void removePlanExercise(Long id) {
        planExerciseRepository.deleteById(id);
    }
}
