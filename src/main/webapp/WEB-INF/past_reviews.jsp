<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.event_booking_project_90.model.Review" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Photographer Reviews | Past Reviews</title>
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
            height: 300px;
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

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--secondary);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .review-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            margin-top: -80px;
            position: relative;
            z-index: 10;
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
        }

        .btn-primary:hover {
            background-color: var(--accent);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary {
            background-color: transparent;
            color: var(--secondary);
            border: 2px solid var(--secondary);
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: var(--secondary);
            color: white;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            transform: translateY(-3px);
        }

        .review-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            margin-bottom: 30px;
            border: 1px solid #eee;
        }

        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .review-header {
            background-color: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .review-body {
            padding: 20px;
        }

        .review-footer {
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-top: 1px solid #eee;
        }

        .review-stars {
            color: var(--secondary);
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 0 3px rgba(243, 156, 18, 0.2);
            outline: none;
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

        .edit-form-container {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.5s ease;
        }

        .edit-form-container.active {
            max-height: 500px;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ddd;
            font-size: 1.5rem;
            padding: 0 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: var(--secondary);
        }

        .review-tag {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .tag-excellent {
            background-color: #2ecc71;
            color: white;
        }

        .tag-good {
            background-color: #3498db;
            color: white;
        }

        .tag-average {
            background-color: #f39c12;
            color: white;
        }

        .tag-poor {
            background-color: #e74c3c;
            color: white;
        }
    </style>
    <script>
        function toggleEditForm(reviewId) {
            const form = document.getElementById('edit-form-' + reviewId);
            form.classList.toggle('active');
        }

        function updateStarRating(formId, rating) {
            document.getElementById(formId + '-rating').value = rating;

            // Update the visual stars
            for (let i = 1; i <= 5; i++) {
                const star = document.getElementById(formId + '-star' + i);
                if (i <= rating) {
                    star.classList.remove('far');
                    star.classList.add('fas');
                } else {
                    star.classList.remove('fas');
                    star.classList.add('far');
                }
            }
        }

        function confirmDelete(reviewId) {
            return confirm('Are you sure you want to delete this review?');
        }
    </script>
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
        <div class="flex items-center">
            <a href="SortedProfilesServlet" class="btn-secondary hidden md:block">Top Photographers</a>
            <button class="block md:hidden focus:outline-none">
                <i class="fas fa-bars text-white text-2xl"></i>
            </button>
        </div>
    </div>
</header>

<!-- Hero Section with Profile Info -->
<section class="header flex items-center">
    <div class="header-overlay"></div>
    <div class="container mx-auto px-6 header-content text-center text-white py-16">
        <h1 class="text-3xl md:text-4xl font-bold mb-2">
            <%= request.getParameter("selectedProfile") %>'s Reviews
        </h1>
        <p class="text-xl text-yellow-400 mb-6">
            What clients are saying
        </p>
    </div>
</section>

<!-- Reviews Container -->
<section class="container mx-auto px-6 pb-20">
    <div class="review-container p-8">
        <%
            String selectedProfile = request.getParameter("selectedProfile");
            List<Review> reviews = (List<Review>) request.getAttribute("reviews");
            if (reviews != null && !reviews.isEmpty()) {
                for (int i = 0; i < reviews.size(); i++) {
                    Review review = reviews.get(i);
                    String reviewId = "review-" + i;
                    String reviewTag = "";
                    String tagClass = "";

                    if (review.getRating() == 5) {
                        reviewTag = "Excellent";
                        tagClass = "tag-excellent";
                    } else if (review.getRating() == 4) {
                        reviewTag = "Good";
                        tagClass = "tag-good";
                    } else if (review.getRating() == 3) {
                        reviewTag = "Average";
                        tagClass = "tag-average";
                    } else {
                        reviewTag = "Poor";
                        tagClass = "tag-poor";
                    }
        %>
        <div class="review-card">
            <div class="review-header flex justify-between items-center">
                <div class="flex items-center">
                    <div class="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center mr-4">
                        <i class="fas fa-user text-gray-500"></i>
                    </div>
                    <div>
                        <h3 class="font-bold text-lg"><%= review.getUsername() %></h3>
                        <div class="review-stars">
                            <% for(int j = 1; j <= 5; j++) { %>
                            <i class="<%= j <= review.getRating() ? "fas" : "far" %> fa-star"></i>
                            <% } %>
                        </div>
                    </div>
                </div>
                <span class="review-tag <%= tagClass %>"><%= reviewTag %></span>
            </div>

            <div class="review-body">
                <p class="text-gray-700">"<%= review.getComment() %>"</p>
            </div>

            <div class="review-footer flex justify-between items-center">
                <div class="text-gray-500 text-sm">
                    <i class="far fa-clock mr-1"></i> Posted recently
                </div>
                <div class="flex space-x-3">
                    <button onclick="toggleEditForm('<%= reviewId %>')" class="text-blue-500 hover:text-blue-700 flex items-center">
                        <i class="fas fa-edit mr-1"></i> Edit
                    </button>
                    <form action="ReviewServlet" method="post" onsubmit="return confirmDelete('<%= reviewId %>');" class="inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="selectedProfile" value="<%= selectedProfile %>">
                        <input type="hidden" name="username" value="<%= review.getUsername() %>">
                        <input type="hidden" name="comment" value="<%= review.getComment() %>">
                        <button type="submit" class="text-red-500 hover:text-red-700 flex items-center">
                            <i class="fas fa-trash-alt mr-1"></i> Delete
                        </button>
                    </form>
                </div>
            </div>

            <!-- Edit Form - Hidden by default -->
            <div id="edit-form-<%= reviewId %>" class="edit-form-container bg-gray-50 p-6 border-t border-gray-200">
                <h4 class="font-bold text-lg mb-4">Edit Your Review</h4>
                <form action="ReviewServlet" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="selectedProfile" value="<%= selectedProfile %>">
                    <input type="hidden" name="originalUsername" value="<%= review.getUsername() %>">
                    <input type="hidden" name="originalComment" value="<%= review.getComment() %>">
                    <input type="hidden" id="<%= reviewId %>-rating" name="rating" value="<%= review.getRating() %>">

                    <div class="md:col-span-2">
                        <label class="block text-gray-700 font-medium mb-2">Your Name</label>
                        <input type="text" name="username" value="<%= review.getUsername() %>" class="form-input">
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-gray-700 font-medium mb-2">Your Rating</label>
                        <div class="flex">
                            <% for(int j = 1; j <= 5; j++) { %>
                            <i id="<%= reviewId %>-star<%= j %>"
                               class="<%= j <= review.getRating() ? "fas" : "far" %> fa-star text-2xl <%= j <= review.getRating() ? "text-yellow-500" : "text-gray-300" %> cursor-pointer mr-2"
                               onclick="updateStarRating('<%= reviewId %>', <%= j %>)"></i>
                            <% } %>
                        </div>
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-gray-700 font-medium mb-2">Your Review</label>
                        <textarea name="comment" rows="4" class="form-input"><%= review.getComment() %></textarea>
                    </div>

                    <div class="md:col-span-2 flex justify-end space-x-4">
                        <button type="button" onclick="toggleEditForm('<%= reviewId %>')" class="btn-secondary">
                            Cancel
                        </button>
                        <button type="submit" class="btn-primary">
                            Update Review
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <% }
        } else { %>
        <div class="text-center py-16">
            <div class="w-24 h-24 rounded-full bg-gray-100 flex items-center justify-center mx-auto mb-6">
                <i class="far fa-comment-dots text-4xl text-gray-400"></i>
            </div>
            <h3 class="text-2xl font-bold mb-4">No Reviews Yet</h3>
            <p class="text-gray-600 mb-8">Be the first to share your experience with <%= selectedProfile %></p>
            <a href="index.jsp#reviews" class="btn-primary">Write a Review</a>
        </div>
        <% } %>

        <div class="text-center mt-12">
            <a href="index.jsp" class="btn-primary inline-flex items-center">
                <i class="fas fa-arrow-left mr-2"></i>
                Back to Photographers
            </a>
        </div>
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
