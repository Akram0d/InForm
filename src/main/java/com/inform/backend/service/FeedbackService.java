package com.inform.backend.service;

import com.inform.backend.dto.FeedbackDTO;
import com.inform.backend.model.Feedback;
import com.inform.backend.model.User;
import com.inform.backend.repository.FeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class FeedbackService {

    private final FeedbackRepository feedbackRepository;

    @Autowired
    public FeedbackService(FeedbackRepository feedbackRepository) {
        this.feedbackRepository = feedbackRepository;
    }

    public Feedback addFeedback(Feedback feedback) {
        return feedbackRepository.save(feedback);
    }

    public List<FeedbackDTO> getAllFeedback() {
        List<Feedback> feedbacks = feedbackRepository.findAll();

        return feedbacks.stream()
                .map(f -> new FeedbackDTO(
                        f.getId(),
                        f.getFeedback(),
                        f.getCreatedAt(),
                        f.getUser() != null ? f.getUser().getId() : null))
                .collect(Collectors.toList());
    }

    public List<Feedback> getFeedbackByUser(User user) {
        return feedbackRepository.findByUserId(user.getId());
    }

    public void deleteFeedback(Long id) {
        feedbackRepository.deleteById(id);
    }
}
