<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.event_booking_project_90.model.Review" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Photographer Reviews | Find Your Perfect Match</title>
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
            color: var(--dark);
            overflow-x: hidden;
        }

        .hero-section {
            background: linear-gradient(135deg, #2c3e50 0%, #1a252f 100%);
            height: 80vh;
            position: relative;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .profile-slider {
            background: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
            overflow: hidden;
            padding: 20px;
            transform: translateY(-80px);
        }

        .profile-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .profile-image {
            width: 220px;
            height: 220px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--secondary);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .profile-image:hover {
            transform: scale(1.05);
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

        .review-form {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 0 3px rgba(243, 156, 18, 0.2);
            outline: none;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ddd;
            font-size: 2rem;
            padding: 0 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: var(--secondary);
        }

        .review-card {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .review-rating {
            color: var(--secondary);
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .pagination-btn {
            background-color: var(--primary);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }

        .pagination-btn:hover {
            background-color: var(--secondary);
            transform: scale(1.1);
        }

        .highlight {
            background: linear-gradient(120deg, rgba(243, 156, 18, 0.2) 0%, rgba(243, 156, 18, 0.2) 100%);
            background-repeat: no-repeat;
            background-size: 100% 40%;
            background-position: 0 90%;
            padding: 0 5px;
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

        .testimonial-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 80px 0;
        }

        .section-title {
            position: relative;
            margin-bottom: 50px;
            font-weight: 700;
        }

        .section-title:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background-color: var(--secondary);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
        }

        footer {
            background-color: var(--primary);
            color: white;
            padding: 60px 0 30px;
        }

        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
            margin-right: 10px;
        }

        .social-links a:hover {
            background-color: var(--secondary);
            transform: translateY(-3px);
        }

        .footer-link {
            color: rgba(255, 255, 255, 0.7);
            transition: all 0.3s ease;
        }

        .footer-link:hover {
            color: var(--secondary);
        }
    </style>
    <script>
        let profiles = [
            { name: "Kamal", role: "Professional Photographer", bio: "Specializing in wedding photography with 8+ years of experience", image: "p11.jpg" },
            { name: "Sunil", role: "Portrait Photographer", bio: "Creating stunning portraits that capture the essence of you", image: "p22.jpg" },
            { name: "Amal", role: "Event Photographer", bio: "Documenting your special events with a creative touch", image: "p33.jpg" },
            { name: "Saman", role: "Commercial Photographer", bio: "Helping businesses tell their story through professional imagery", image: "p4.jpg" },
            { name: "Gihan", role: "Cinematographer", bio: "Crafting cinematic stories that bring your vision to life", image: "p5.jpg" },
            { name: "Sehan", role: "Videographer", bio: "Passionate about creating authentic and emotive films", image: "p6.jpg" }
        ];

        let currentIndex = 0;

        function updateProfile() {
            let profile = profiles[currentIndex];
            document.getElementById("profile-image").src = profile.image;
            document.getElementById("profile-name").innerText = profile.name;
            document.getElementById("profile-role").innerText = profile.role;
            document.getElementById("profile-bio").innerText = profile.bio;

            // Update the hidden field for the review form
            document.getElementById("selectedProfile").value = profile.name;
            document.getElementById("currentProfileName").innerText = profile.name;

            // Update progress indicators
            document.querySelectorAll('.progress-indicator').forEach((indicator, index) => {
                if (index === currentIndex) {
                    indicator.classList.remove('bg-gray-300');
                    indicator.classList.add('bg-yellow-500');
                } else {
                    indicator.classList.remove('bg-yellow-500');
                    indicator.classList.add('bg-gray-300');
                }
            });
        }

        function nextProfile() {
            currentIndex = (currentIndex + 1) % profiles.length;
            updateProfile();
        }

        function prevProfile() {
            currentIndex = (currentIndex - 1 + profiles.length) % profiles.length;
            updateProfile();
        }

        function loadReviews() {
            let profileName = profiles[currentIndex].name;
            window.location.href = "ReviewServlet?selectedProfile=" + encodeURIComponent(profileName) + "&redirect=past_reviews.jsp";
        }

        function setupStarRating() {
            const stars = document.querySelectorAll('.star-rating input');
            stars.forEach(star => {
                star.addEventListener('change', function() {
                    document.getElementById('rating').value = this.value;
                });
            });
        }

        window.onload = function() {
            updateProfile();
            setupStarRating();
        };
    </script>
</head>
<body>
<!-- Header/Navigation -->
<header class="bg-gray-900 text-white py-4">
    <div class="container mx-auto px-6 flex items-center justify-between">
        <a href="#" class="logo flex items-center">
            <i class="fas fa-camera-retro mr-2"></i>
            <span>SnapPro</span>
        </a>
        <nav class="hidden md:flex space-x-8">
            <a href="#" class="nav-link">Home</a>
            <a href="#photographers" class="nav-link">Photographers</a>
            <a href="#reviews" class="nav-link">Reviews</a>
            <a href="#contact" class="nav-link">Contact</a>
        </nav>
        <div class="flex items-center">
            <a href="SortedProfilesServlet" class="btn-secondary hidden md:block">Top Photographers</a>
            <button class="block md:hidden focus:outline-none">
                <i class="fas fa-bars text-white text-2xl"></i>
            </button>
        </div>
    </div>
</header>

<!-- Hero Section -->
<section class="hero-section flex items-center">
    <div class="hero-overlay"></div>
    <div class="container mx-auto px-6 hero-content text-center text-white">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">Find Your Perfect <span class="text-yellow-400">Photographer</span></h1>
        <p class="text-lg md:text-xl mb-8 max-w-3xl mx-auto">Discover talented photographers and videographers who can capture your special moments with style and creativity.</p>
        <a href="#photographers" class="btn-primary inline-block">Explore Photographers</a>
    </div>
</section>

<!-- Photographer Profiles Section -->
<section id="photographers" class="py-20">
    <div class="container mx-auto px-6">
        <div class="profile-slider">
            <div class="flex flex-col md:flex-row items-center">
                <!-- Profile Details -->
                <div class="md:w-1/2 flex flex-col items-center text-center md:text-left md:items-start p-6">
                    <h2 class="text-3xl font-bold mb-2" id="profile-name"></h2>
                    <p class="text-yellow-500 font-semibold mb-4" id="profile-role"></p>
                    <p class="text-gray-600 mb-6" id="profile-bio"></p>
                    <div class="flex space-x-4 mb-8">
                        <button onclick="loadReviews()" class="btn-secondary flex items-center">
                            <i class="fas fa-star mr-2"></i> View Reviews
                        </button>
                        <a href="#reviews" class="btn-primary flex items-center">
                            <i class="fas fa-pen-alt mr-2"></i> Write Review
                        </a>
                    </div>

                    <!-- Social Media Links -->
                    <div class="flex space-x-4 mb-6">
                        <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                            <i class="fab fa-instagram text-xl"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                            <i class="fab fa-facebook text-xl"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                            <i class="fab fa-twitter text-xl"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-yellow-500 transition-colors">
                            <i class="fas fa-globe text-xl"></i>
                        </a>
                    </div>

                    <!-- Progress Indicators -->
                    <div class="flex space-x-2 mt-4">
                        <% for(int i = 0; i < 6; i++) { %>
                        <div class="progress-indicator w-8 h-2 rounded-full bg-gray-300 transition-colors"></div>
                        <% } %>
                    </div>
                </div>

                <!-- Profile Image -->
                <div class="md:w-1/2 relative flex justify-center p-6">
                    <div class="relative">
                        <img id="profile-image" src="" alt="Photographer" class="profile-image">
                        <div class="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-full">
                            <button onclick="prevProfile()" class="pagination-btn">
                                <i class="fas fa-chevron-left"></i>
                            </button>
                        </div>
                        <div class="absolute right-0 top-1/2 -translate-y-1/2 translate-x-full">
                            <button onclick="nextProfile()" class="pagination-btn">
                                <i class="fas fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Reviews Section -->
<section id="reviews" class="py-20 bg-gray-50">
    <div class="container mx-auto px-6">
        <h2 class="section-title text-3xl font-bold text-center mb-16">Share Your Experience</h2>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-10">
            <!-- Review Form -->
            <div class="review-form">
                <h3 class="text-2xl font-bold mb-6">Write a Review for <span id="currentProfileName"></span></h3>
                <form action="ReviewServlet" method="post" class="space-y-6">
                    <input type="hidden" name="selectedProfile" id="selectedProfile">
                    <input type="hidden" name="rating" id="rating" value="5">

                    <div>
                        <label for="username" class="block text-gray-700 font-medium mb-2">Your Name</label>
                        <input type="text" id="username" name="username" class="form-input" required>
                    </div>

                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Your Rating</label>
                        <div class="star-rating flex justify-center md:justify-start">
                            <input type="radio" id="star5" name="star-rating" value="5" checked>
                            <label for="star5"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star4" name="star-rating" value="4">
                            <label for="star4"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star3" name="star-rating" value="3">
                            <label for="star3"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star2" name="star-rating" value="2">
                            <label for="star2"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star1" name="star-rating" value="1">
                            <label for="star1"><i class="fas fa-star"></i></label>
                        </div>
                    </div>

                    <div>
                        <label for="comment" class="block text-gray-700 font-medium mb-2">Your Experience</label>
                        <textarea id="comment" name="comment" rows="5" class="form-input" required placeholder="Share your experience working with this photographer..."></textarea>
                    </div>

                    <button type="submit" class="btn-primary w-full">
                        <i class="fas fa-paper-plane mr-2"></i>Submit Review
                    </button>
                </form>
            </div>

            <!-- Recent Reviews -->
            <div>
                <h3 class="text-2xl font-bold mb-6">Recent Reviews</h3>

                <% List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                    if (reviews != null && !reviews.isEmpty()) {
                        for (Review review : reviews) { %>
                <div class="review-card">
                    <div class="flex justify-between items-start mb-3">
                        <div>
                            <h4 class="font-bold text-lg"><%= review.getUsername() %></h4>
                            <div class="review-rating">
                                <% for(int i = 1; i <= 5; i++) { %>
                                <i class="<%= i <= review.getRating() ? "fas" : "far" %> fa-star"></i>
                                <% } %>
                            </div>
                        </div>
                        <div class="text-gray-500 text-sm">2 days ago</div>
                    </div>
                    <p class="text-gray-600">"<%= review.getComment() %>"</p>
                </div>
                <% }
                } else { %>
                <div class="review-card flex flex-col items-center justify-center py-10 text-center">
                    <i class="far fa-comment-dots text-5xl text-gray-300 mb-4"></i>
                    <p class="text-gray-500 mb-4">No reviews yet. Be the first to review!</p>
                    <a href="#reviews" class="btn-secondary">Write a Review</a>
                </div>
                <% } %>

                <div class="mt-6 text-center">
                    <a href="SortedProfilesServlet" class="btn-primary inline-flex items-center">
                        <i class="fas fa-award mr-2"></i>
                        View Top Rated Photographers
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonial Section -->
<section class="testimonial-section">
    <div class="container mx-auto px-6">
        <h2 class="section-title text-3xl font-bold text-center">What Our Clients Say</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mt-16">
            <div class="review-card text-center">
                <div class="w-20 h-20 rounded-full bg-gray-300 mx-auto mb-4 overflow-hidden">
                    <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Client" class="w-full h-full object-cover">
                </div>
                <h4 class="font-bold text-lg mb-2">Sarah Johnson</h4>
                <div class="review-rating mb-4 justify-center flex">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <p class="text-gray-600">"Working with Kamal for our wedding was the best decision we made. The photos captured every moment perfectly!"</p>
            </div>

            <div class="review-card text-center">
                <div class="w-20 h-20 rounded-full bg-gray-300 mx-auto mb-4 overflow-hidden">
                    <img src="https://randomuser.me/api/portraits/men/47.jpg" alt="Client" class="w-full h-full object-cover">
                </div>
                <h4 class="font-bold text-lg mb-2">Michael Thomson</h4>
                <div class="review-rating mb-4 justify-center flex">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <p class="text-gray-600">"Sunil did an amazing job with our corporate event photography. Professional, prompt and high-quality work."</p>
            </div>

            <div class="review-card text-center">
                <div class="w-20 h-20 rounded-full bg-gray-300 mx-auto mb-4 overflow-hidden">
                    <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Client" class="w-full h-full object-cover">
                </div>
                <h4 class="font-bold text-lg mb-2">Emily Rodriguez</h4>
                <div class="review-rating mb-4 justify-center flex">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <p class="text-gray-600">"Gihan created the most beautiful video of our wedding day. The storytelling and editing were absolutely perfect!"</p>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action -->
<section id="contact" class="bg-yellow-500 py-20">
    <div class="container mx-auto px-6 text-center">
        <h2 class="text-3xl font-bold text-white mb-6">Ready to Capture Your Special Moments?</h2>
        <p class="text-white text-lg mb-8 max-w-2xl mx-auto">Connect with our talented photographers and videographers today to discuss your project needs.</p>
        <a href="#photographers" class="bg-white text-yellow-500 font-bold py-3 px-8 rounded-full hover:bg-gray-100 transition-colors inline-flex items-center">
            <i class="fas fa-search mr-2"></i>
            Find Your Photographer
        </a>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-16">
            <div>
                <h3 class="text-xl font-bold mb-6">SnapPro</h3>
                <p class="text-gray-400 mb-6">Connecting talented photographers with clients looking for exceptional visual content.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <div>
                <h4 class="text-lg font-bold mb-6">Quick Links</h4>
                <ul class="space-y-3">
                    <li><a href="#" class="footer-link">Home</a></li>
                    <li><a href="#photographers" class="footer-link">Photographers</a></li>
                    <li><a href="#reviews" class="footer-link">Reviews</a></li>
                    <li><a href="SortedProfilesServlet" class="footer-link">Top Photographers</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-bold mb-6">Resources</h4>
                <ul class="space-y-3">
                    <li><a href="#" class="footer-link">Photography Tips</a></li>
                    <li><a href="#" class="footer-link">Photography Styles</a></li>
                    <li><a href="#" class="footer-link">FAQ</a></li>
                    <li><a href="#" class="footer-link">Support</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-bold mb-6">Contact Us</h4>
                <ul class="space-y-3">
                    <li class="flex items-start">
                        <i class="fas fa-map-marker-alt mt-1 mr-3 text-yellow-500"></i>
                        <span>123 Photography St, Colombo, Sri Lanka</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-phone-alt mr-3 text-yellow-500"></i>
                        <span>+94 123 456 789</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-envelope mr-3 text-yellow-500"></i>
                        <span>info@snappro.com</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-700 pt-8 text-center text-gray-400">
            <p>© 2025 SnapPro. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>