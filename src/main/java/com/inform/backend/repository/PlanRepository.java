package com.inform.backend.repository;

import com.inform.backend.model.Plan;
import com.inform.backend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {

    List<Plan> findByUserId(Long userId);
    Optional<Plan> findByUserIdAndType(Long userId, Plan.PlanType type);
    boolean existsByUserAndTrainer(User user, User trainer);

    List<Plan> findByTrainer(User trainer);

    List<Plan> findByUserAndType(User user, Plan.PlanType type);

}
