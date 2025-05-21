<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white font-sans">
<div class="min-h-screen flex items-center justify-center">
    <div class="bg-gray-900 p-8 rounded-2xl shadow-xl text-center w-full max-w-md">
        <h1 class="text-2xl font-bold mb-4 text-green-400">✅ Booking Successful!</h1>
        <p class="mb-6 text-gray-300">Your booking has been confirmed with the following details:</p>

        <div class="text-left text-sm bg-gray-800 p-4 rounded mb-6">
            <p><strong>Client Name:</strong> <%= request.getAttribute("clientName") %></p>
            <p><strong>Event Type:</strong> <%= request.getAttribute("eventType") %></p>
            <p><strong>Event Date:</strong> <%= request.getAttribute("eventDate") %></p>
            <p><strong>Location:</strong> <%= request.getAttribute("location") %></p>
            <p><strong>Photographer ID:</strong> <%= request.getAttribute("photographerId") %></p>
        </div>

        <a href="index.jsp" class="inline-block bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-300">
            Book Another
        </a>
        <!--<a href="viewBookings.jsp" class="inline-block ml-4 text-blue-400 underline hover:text-white">
          View Bookings-->
        </a>
    </div>
</div>
</body>
</html>

