package com.inform.backend.service;

import com.inform.backend.dto.CreatePlanRequest;
import com.inform.backend.model.Plan;
import com.inform.backend.model.User;
import com.inform.backend.repository.PlanRepository;
import com.inform.backend.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class PlanService {

    private final PlanRepository planRepository;
    private final UserRepository userRepository;


    public PlanService(PlanRepository planRepository,  UserRepository userRepository) {
        this.planRepository = planRepository;
        this.userRepository = userRepository;
    }

    public List<Plan> getAllPlans() {
        return planRepository.findAll();
    }

    public Optional<Plan> getCoachPlan(User user) {
        return planRepository.findByUserIdAndType(user.getId(), Plan.PlanType.COACH);
    }


    public Optional<Plan> getPlanById(Long id) {
        return planRepository.findById(id);
    }

    public List<Plan> getPlansByUser(User user) {
        return planRepository.findByUserId(user.getId());
    }

    public Plan createPlan(CreatePlanRequest request, User authenticatedUser) {
        Plan plan = new Plan();
        plan.setName(request.getName());
        plan.setCreatedAt(LocalDate.now());

        if (authenticatedUser.getRole() == User.Role.USER) {
            // It's a personal plan for yourself
            plan.setType(Plan.PlanType.PERSONAL);
            plan.setUser(authenticatedUser);
            plan.setTrainer(null);

        } else if (authenticatedUser.getRole() == User.Role.TRAINER) {
            // It's a coach plan for a specific user
            if (request.getUserId() == null) {
                throw new IllegalArgumentException("User ID is required for trainer plans.");
            }

            User trainee = userRepository.findById(request.getUserId())
                    .orElseThrow(() -> new RuntimeException("User not found"));

            if (planRepository.existsByUserAndTrainer(trainee, authenticatedUser)) {
                throw new RuntimeException("A coach plan already exists for this user.");
            }

            plan.setType(Plan.PlanType.COACH);
            plan.setUser(trainee);
            plan.setTrainer(authenticatedUser);
        } else {
            throw new RuntimeException("Invalid user role for creating a plan.");
        }

        return planRepository.save(plan);
    }

    public Plan updatePlan(Long planId, String newName) {
        Plan plan = planRepository.findById(planId)
                .orElseThrow(() -> new RuntimeException("Plan not found"));

        plan.setName(newName);
        return planRepository.save(plan);
    }


    public void deletePlan(Long id) {
        planRepository.deleteById(id);
    }
}
