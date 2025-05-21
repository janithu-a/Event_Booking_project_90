<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.event_booking_project_90.model.ProfileRating" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Rated Photographers | SnapPro</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #f39c12;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #1a252f 100%);
            height: 400px;
            clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
            position: relative;
        }

        .header-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }

        .header-content {
            position: relative;
            z-index: 2;
        }

        .btn-primary {
            background-color: var(--secondary);
            color: white;
            padding: 12px 24px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: inline-block;
        }

        .btn-primary:hover {
            background-color: var(--accent);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--secondary);
            letter-spacing: 1px;
        }

        .nav-link {
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-link:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--secondary);
            transition: width 0.3s ease;
        }

        .nav-link:hover:after {
            width: 100%;
        }

        .profile-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: relative;
            padding-left: 40px;
        }

        .profile-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .rank-badge {
            position: absolute;
            left: -20px;
            top: 50%;
            transform: translateY(-50%);
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border: 4px solid white;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--secondary);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .profile-card:hover .profile-image {
            transform: scale(1.05);
        }

        .rating-stars {
            color: var(--secondary);
            font-size: 1.2rem;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .status-top {
            background-color: #2ecc71;
            color: white;
        }

        .status-recommended {
            background-color: #3498db;
            color: white;
        }

        .status-average {
            background-color: #f39c12;
            color: white;
        }

        .status-new {
            background-color: #9b59b6;
            color: white;
        }

        .section-title {
            position: relative;
            display: inline-block;
            margin-bottom: 50px;
        }

        .section-title:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background: var(--secondary);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
        }

        .subtitle {
            max-width: 600px;
            margin: 0 auto 60px;
            text-align: center;
            color: #666;
            font-size: 1.1rem;
            line-height: 1.7;
        }

        .progress-bar {
            height: 8px;
            border-radius: 4px;
            background-color: #eee;
            position: relative;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            border-radius: 4px;
            background: linear-gradient(90deg, #f39c12 0%, #e67e22 100%);
            position: absolute;
            left: 0;
            top: 0;
        }

        .stat-container {
            margin-top: -80px;
            position: relative;
            z-index: 10;
        }

        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }

        .stat-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: var(--secondary);
            font-size: 1.8rem;
        }

        .profile-grid {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<!-- Header/Navigation -->
<header class="bg-gray-900 text-white py-4">
    <div class="container mx-auto px-6 flex items-center justify-between">
        <a href="index.jsp" class="logo flex items-center">
            <i class="fas fa-camera-retro mr-2"></i>
            <span>SnapPro</span>
        </a>
        <nav class="hidden md:flex space-x-8">
            <a href="index.jsp" class="nav-link">Home</a>
            <a href="index.jsp#photographers" class="nav-link">Photographers</a>
            <a href="index.jsp#reviews" class="nav-link">Reviews</a>
            <a href="index.jsp#contact" class="nav-link">Contact</a>
        </nav>
        <button class="block md:hidden focus:outline-none">
            <i class="fas fa-bars text-white text-2xl"></i>
        </button>
    </div>
</header>

<!-- Hero Section -->
<section class="header flex items-center">
    <div class="header-overlay"></div>
    <div class="container mx-auto px-6 header-content text-center text-white py-16">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Top Photographers & Videographers</h1>
        <p class="text-xl mb-8 max-w-2xl mx-auto">Discover our highest-rated professionals based on client reviews and ratings. Find the perfect match for your next project.</p>
        <a href="index.jsp#reviews" class="btn-primary">
            <i class="fas fa-pen-alt mr-2"></i> Write a Review
        </a>
    </div>
</section>

<!-- Stats Section -->
<section class="container mx-auto px-6">
    <div class="stat-container grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="stat-card">
            <div class="stat-icon">
                <i class="fas fa-users"></i>
            </div>
            <h3 class="text-2xl font-bold mb-2">Professional Team</h3>
            <p class="text-gray-600">Our platform connects you with the most talented photographers in the industry.</p>
        </div>

        <div class="stat-card">
            <div class="stat-icon">
                <i class="fas fa-star"></i>
            </div>
            <h3 class="text-2xl font-bold mb-2">Verified Reviews</h3>
            <p class="text-gray-600">All ratings and reviews are from real clients who have worked with our photographers.</p>
        </div>

        <div class="stat-card">
            <div class="stat-icon">
                <i class="fas fa-camera"></i>
            </div>
            <h3 class="text-2xl font-bold mb-2">Quality Photography</h3>
            <p class="text-gray-600">Every photographer is vetted for quality, professionalism, and customer service.</p>
        </div>
    </div>
</section>

<!-- Top Photographers Section -->
<section class="py-20">
    <div class="container mx-auto px-6 text-center">
        <h2 class="section-title text-3xl font-bold">Our Top Rated Professionals</h2>
        <p class="subtitle">
            Based on client reviews and ratings, these are our most highly recommended photographers and videographers. Each professional is ranked according to their average star rating.
        </p>

        <div class="profile-grid">
            <%
                List<ProfileRating> profileRatings = (List<ProfileRating>) request.getAttribute("profileRatings");
                if (profileRatings != null) {
                    for (int i = 0; i < profileRatings.size(); i++) {
                        ProfileRating pr = profileRatings.get(i);
                        String imageName = "p" + (i+1) + (i+1) + ".jpg"; // p11.jpg, p22.jpg, etc.
                        if (i == 3) imageName = "p4.jpg";
                        if (i == 4) imageName = "p5.jpg";
                        if (i == 5) imageName = "p6.jpg";

                        String statusClass = "";
                        String statusText = "";

                        if (pr.getAverageRating() >= 4.5) {
                            statusClass = "status-top";
                            statusText = "Top Rated";
                        } else if (pr.getAverageRating() >= 3.5) {
                            statusClass = "status-recommended";
                            statusText = "Recommended";
                        } else if (pr.getAverageRating() > 0) {
                            statusClass = "status-average";
                            statusText = "Average";
                        } else {
                            statusClass = "status-new";
                            statusText = "New";
                        }
            %>
            <div class="profile-card flex items-center p-6 mb-8">
                <div class="rank-badge"><%= i+1 %></div>

                <div class="flex items-center flex-1">
                    <div class="mr-6">
                        <img src="<%= imageName %>" alt="<%= pr.getProfileName() %>" class="profile-image">
                    </div>

                    <div class="flex-1">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="text-xl font-bold"><%= pr.getProfileName() %></h3>
                            <span class="status-badge <%= statusClass %>"><%= statusText %></span>
                        </div>

                        <div class="rating-stars mb-3">
                            <% for (int j = 0; j < 5; j++) { %>
                            <% if (j < Math.floor(pr.getAverageRating())) { %>
                            <i class="fas fa-star"></i>
                            <% } else if (j < Math.ceil(pr.getAverageRating()) && pr.getAverageRating() % 1 != 0) { %>
                            <i class="fas fa-star-half-alt"></i>
                            <% } else { %>
                            <i class="far fa-star"></i>
                            <% } %>
                            <% } %>
                            <span class="ml-2 text-gray-600">
                                    <%= String.format("%.1f", pr.getAverageRating()) %> from <%= pr.getReviewCount() %> reviews
                                </span>
                        </div>

                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <p class="text-sm text-gray-500 mb-1">Rating Distribution</p>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: <%= pr.getAverageRating() * 20 %>%;"></div>
                                </div>
                            </div>

                            <div class="text-right">
                                <a href="ReviewServlet?selectedProfile=<%= pr.getProfileName() %>&redirect=past_reviews.jsp" class="inline-block text-blue-500 hover:text-blue-700 font-medium">
                                    <i class="fas fa-comment-alt mr-1"></i> View Reviews
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }
            } else { %>
            <div class="text-center py-16">
                <div class="w-24 h-24 rounded-full bg-gray-100 flex items-center justify-center mx-auto mb-6">
                    <i class="fas fa-exclamation-circle text-4xl text-gray-400"></i>
                </div>
                <h3 class="text-2xl font-bold mb-4">No Profiles Found</h3>
                <p class="text-gray-600 mb-8">There are no rated profiles available at this time.</p>
            </div>
            <% } %>
        </div>

        <div class="mt-16">
            <a href="index.jsp" class="btn-primary">
                <i class="fas fa-arrow-left mr-2"></i> Back to Home
            </a>
        </div>
    </div>
</section>

<!-- Call to Action -->
<section class="bg-yellow-500 py-20">
    <div class="container mx-auto px-6 text-center">
        <h2 class="text-3xl font-bold text-white mb-6">Find Your Perfect Photographer Today</h2>
        <p class="text-white text-lg mb-8 max-w-2xl mx-auto">Whether you're planning a wedding, a corporate event, or a personal photoshoot, our platform helps you connect with the best talent.</p>
        <a href="index.jsp#photographers" class="bg-white text-yellow-500 font-bold py-3 px-8 rounded-full hover:bg-gray-100 transition-colors inline-flex items-center">
            <i class="fas fa-search mr-2"></i>
            Browse All Photographers
        </a>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="container mx-auto px-6 text-center">
        <a href="index.jsp" class="logo flex items-center justify-center mb-6">
            <i class="fas fa-camera-retro mr-2"></i>
            <span>SnapPro</span>
        </a>
        <p class="text-gray-400 mb-8">Connect with talented photographers for your special moments.</p>
        <div class="flex justify-center space-x-6 mb-8">
            <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                <i class="fab fa-linkedin-in"></i>
            </a>
        </div>
        <p class="text-sm text-gray-500">&copy; 2025 SnapPro. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
