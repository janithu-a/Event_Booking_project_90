package com.example.event_booking_project_90.model;

public class Photography {
    private String id;
    private String title;
    private String date;
    private String location;
    private String description;
    private String username;

    public Photography() {
    }

    public Photography(String id, String title, String date, String location, String description, String username) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.location = location;
        this.description = description;
        this.username = username;
    }
}
