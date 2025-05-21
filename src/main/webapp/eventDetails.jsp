<%@ page import="com.example.event_booking_project_90.util.PhotoEventFileHandler" %>
<%@ page import="com.example.event_booking_project_90.model.Photography" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 30px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .back-link {
            margin-bottom: 20px;
            display: block;
        }
        .event-detail {
            margin-bottom: 30px;
        }
        .event-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .event-title {
            font-size: 28px;
            margin: 0;
            color: #333;
        }
        .event-meta {
            margin: 20px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        .meta-item {
            margin: 10px 0;
        }
        .event-description {
            line-height: 1.6;
        }
        .button-row {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .confirmation-message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            display: none;
        }
        #bookingModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            overflow-y: auto;
        }
        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 20px;
            width: 80%;
            max-width: 500px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            max-height: 90vh;
            overflow-y: auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
    <script>
        function openBookingModal() {
            document.getElementById('bookingModal').style.display = 'block';
        }

        function closeBookingModal() {
            document.getElementById('bookingModal').style.display = 'none';
        }

        // Close modal when clicking outside of it
        window.onclick = function(event) {
            var modal = document.getElementById('bookingModal');
            if (event.target === modal) {
                closeBookingModal();
            }
        }
    </script>
</head>
<body>
<%
    String eventId = request.getParameter("eventId");
    Photography event = null;

    if (eventId != null && !eventId.isEmpty()) {
        event = PhotoEventFileHandler.getEventById(eventId);
    }

    if (event == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Check for booking confirmation
    String booked = request.getParameter("booked");
    boolean isBooked = "true".equals(booked);
%>

<header>
    <h1>Photography Event Details</h1>
</header>

<div class="container">
    <a href="index.jsp" class="back-link">← Back to Events</a>

    <% if (isBooked) { %>
    <div class="confirmation-message" style="display: block; margin: 20px 0;">
        <strong>Success!</strong> You have successfully booked this event. Check your email for confirmation details.
    </div>
    <% } %>

    <div class="event-detail">
        <div class="event-header">
            <h2 class="event-title"><%= event.getTitle() %></h2>
        </div>

        <div class="event-meta">
            <p class="meta-item"><strong>Date:</strong> <%= event.getDate() %></p>
            <p class="meta-item"><strong>Location:</strong> <%= event.getLocation() %></p>
            <p class="meta-item"><strong>Organized by:</strong> <%= event.getUsername() %></p>
        </div>

        <div class="event-description">
            <h3>Event Description</h3>
            <p><%= event.getDescription() %></p>
        </div>

        <div class="button-row">
            <button class="btn btn-primary" onclick="openBookingModal()">Book This Event</button>
        </div>
    </div>
</div>

<!-- Modal for booking the event -->
<div id="bookingModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Book Event: <%= event.getTitle() %></h2>
            <span class="close" onclick="closeBookingModal()">&times;</span>
        </div>
        <form action="viewBookings.jsp" method="post">
            <input type="hidden" name="eventId" value="<%= event.getId() %>">

            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="participants">Number of Participants:</label>
                <input type="number" id="participants" name="participants" min="1" value="1" required>
            </div>
            <div class="form-group">
                <label for="specialRequirements">Special Requirements:</label>
                <textarea id="specialRequirements" name="specialRequirements" rows="3"></textarea>
            </div>

            <div class="form-group" style="text-align: right;">
                <button type="button" onclick="closeBookingModal()" style="background-color: #ccc; margin-right: 10px;">Cancel</button>
                <button type="submit" style="background-color: #4CAF50; color: white;">Confirm Booking</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>