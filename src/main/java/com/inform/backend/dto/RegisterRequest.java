package com.inform.backend.dto;


import com.inform.backend.model.User;

public record RegisterRequest(
        String firstName,
        String lastName,
        String email,
        String password,
        User.Role role,
        String profileUrl
) {}

