package com.example.event_booking_project_90.servlet;

public class ReviewServlet {
    private String profileName;
    private double averageRating;
    private int reviewCount;

    public ProfileRating(String profileName, double averageRating, int reviewCount) {
        this.profileName = profileName;
        this.averageRating = averageRating;
        this.reviewCount = reviewCount;
    }

    // Getters
    public String getProfileName() {
        return profileName;
    }
    public double getAverageRating() {
        return averageRating;
    }
    public int getReviewCount() {
        return reviewCount;
    }
}

