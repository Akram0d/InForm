package com.inform.backend.dto;


public record AuthRequest(
        String email,
        String password
) {}
