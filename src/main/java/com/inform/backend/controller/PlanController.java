package com.inform.backend.controller;

import com.inform.backend.dto.CreatePlanRequest;
import com.inform.backend.dto.PlanDTO;
import com.inform.backend.dto.RenamePlanRequest;
import com.inform.backend.model.Plan;
import com.inform.backend.model.User;
import com.inform.backend.service.PlanService;
import com.inform.backend.service.UserService;  // assuming you have this to fetch users
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/plans")
@CrossOrigin
public class PlanController {

    private final PlanService planService;
    private final UserService userService;

    public PlanController(PlanService planService, UserService userService) {
        this.planService = planService;
        this.userService = userService;
    }

    @GetMapping
    public List<Plan> getAllPlans() { /// // Won't be used...
        return planService.getAllPlans();
    }

    @GetMapping("/coach")
    public ResponseEntity<Plan> getCoachPlan(Authentication authentication) {
        String userEmail = authentication.getName();
        Optional<User> userOpt = userService.getUserByEmail(userEmail);
        if (userOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        Optional<Plan> coachPlan = planService.getCoachPlan(userOpt.get());

        return coachPlan.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.noContent().build());
    }


    @GetMapping("/my")
    public ResponseEntity<List<PlanDTO>> getMyPlans(Authentication authentication) {
        String userEmail = authentication.getName();

        Optional<User> userOpt = userService.getUserByEmail(userEmail);

        if (userOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        List<Plan> plans = planService.getPlansByUser(userOpt.get());

        List<PlanDTO> planDTOs = plans.stream()
                .map(plan -> new PlanDTO(plan.getId(), plan.getName(),plan.getType(), plan.getCreatedAt()))
                .collect(Collectors.toList());

        return ResponseEntity.ok(planDTOs);
    }



    @PostMapping
    public ResponseEntity<?> createPlan(@RequestBody CreatePlanRequest request, Authentication authentication) {
        User currentUser = userService.findByEmail(authentication.getName());

        Plan plan = planService.createPlan(request, currentUser);
        return ResponseEntity.ok(plan);
    }

    @PutMapping("/{planId}")
    public ResponseEntity<Plan> updatePlanName(
            @PathVariable Long planId,
            @RequestBody RenamePlanRequest request
    ) {
        Plan updatedPlan = planService.updatePlan(planId, request.getName());
        return ResponseEntity.ok(updatedPlan);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePlan(@PathVariable Long id) {
        planService.deletePlan(id);
        return ResponseEntity.noContent().build();
    }
}
