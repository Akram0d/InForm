package com.inform.backend.controller;

import com.inform.backend.dto.FeedbackDTO;
import com.inform.backend.model.Feedback;
import com.inform.backend.model.User;
import com.inform.backend.service.FeedbackService;
import com.inform.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/feedback")
@CrossOrigin(origins = "*")
public class FeedbackController {

    private final FeedbackService feedbackService;
    private final UserService userService;

    @Autowired
    public FeedbackController(FeedbackService feedbackService, UserService userService) {
        this.feedbackService = feedbackService;
        this.userService = userService;
    }

    @PostMapping
    public ResponseEntity<Feedback> addFeedback(@RequestBody Feedback feedback, Authentication authentication) {
        String userEmail = authentication.getName();
        Optional<User> userOpt = userService.getUserByEmail(userEmail);
        if (userOpt.isEmpty()) {
            return ResponseEntity.status(401).build();
        }
        feedback.setUser(userOpt.get());
        Feedback saved = feedbackService.addFeedback(feedback);
        return ResponseEntity.status(201).body(saved);
    }

    @GetMapping
    public ResponseEntity<List<FeedbackDTO>> getAllFeedback() {
        List<FeedbackDTO> feedbackDTOs = feedbackService.getAllFeedback();
        return ResponseEntity.ok(feedbackDTOs);
    }

    @GetMapping("/my")
    public ResponseEntity<List<Feedback>> getMyFeedback(Authentication authentication) {
        String userEmail = authentication.getName();
        Optional<User> userOpt = userService.getUserByEmail(userEmail);
        if (userOpt.isEmpty()) {
            return ResponseEntity.status(401).build();
        }
        List<Feedback> feedbacks = feedbackService.getFeedbackByUser(userOpt.get());
        return ResponseEntity.ok(feedbacks);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteFeedback(@PathVariable Long id) {
        feedbackService.deleteFeedback(id);
        return ResponseEntity.noContent().build();
    }
}

