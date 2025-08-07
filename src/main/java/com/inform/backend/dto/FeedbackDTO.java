package com.inform.backend.dto;

import java.util.Date;

public class FeedbackDTO {
    private Long id;
    private String feedback;
    private Date createdAt;
    private Long userId;

    public FeedbackDTO() {
        super();
    }
    public FeedbackDTO(Long id, String feedback, Date createdAt, Long userId) {
        super();
        this.id = id;
        this.feedback = feedback;
        this.createdAt = createdAt;
        this.userId = userId;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getFeedback() {
        return feedback;
    }
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    public Date getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }

}
