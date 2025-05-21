package com.example.event_booking_project_90.util;

import com.example.event_booking_project_90.model.Review;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String DIRECTORY_PATH = "C:/event_reviews/"; // Update this path as needed

    public static void initializeDirectory() {
        File dir = new File(DIRECTORY_PATH);
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    public static void saveReviewToFile(Review review) throws IOException {
        String filename = DIRECTORY_PATH + review.getProfileName() + ".txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename, true))) {
            writer.write(review.getUsername() + "|" + review.getRating() + "|" + review.getComment());
            writer.newLine();
        }
    }

    public static void overwriteReviewFile(String profileName, List<Review> reviews) throws IOException {
        String filename = DIRECTORY_PATH + profileName + ".txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename))) {
            for (Review review : reviews) {
                writer.write(review.getUsername() + "|" + review.getRating() + "|" + review.getComment());
                writer.newLine();
            }
        }
    }

    /**
     * Loads reviews for a specific profile from file
     *
     * @param profileName The name of the profile whose reviews to load
     * @return A list of reviews for the profile
     * @throws IOException If an I/O error occurs
     */
    public static List<Review> loadReviewsFromFile(String profileName) throws IOException {
        List<Review> reviews = new ArrayList<>();
        String filename = DIRECTORY_PATH + profileName + ".txt";
        File file = new File(filename);

        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split("\\|");
                    if (parts.length == 3) {
                        reviews.add(new Review(parts[0], profileName, Integer.parseInt(parts[1]), parts[2]));
                    }
                }
            }
        }
        return reviews;
    }
}