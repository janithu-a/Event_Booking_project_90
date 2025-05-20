<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white font-sans">
<div class="min-h-screen flex items-center justify-center p-6">
    <div class="w-full max-w-lg bg-gray-900 p-6 rounded-2xl shadow-lg">
        <h1 class="text-2xl font-bold mb-4 text-center text-white">Add New Booking</h1>
        <form action="addBooking" method="post" class="space-y-4">
            <input type="text" name="clientName" placeholder="Client Name" required class="w-full p-2 rounded bg-gray-800 text-white">

            <select name="eventType" required class="w-full p-2 rounded bg-gray-800 text-white">
                <option value="">-- Select Event Type --</option>
                <option value="Photography">Photography</option>
                <option value="Videography">Videography</option>
            </select>

            <input type="date" name="eventDate" required class="w-full p-2 rounded bg-gray-800 text-white">
            <input type="text" name="location" placeholder="Location" required class="w-full p-2 rounded bg-gray-800 text-white">
            <input type="text" name="photographerId" placeholder="Photographer ID" required class="w-full p-2 rounded bg-gray-800 text-white">

            <button type="submit" class="w-full bg-white text-black font-bold p-2 rounded hover:bg-gray-200">
                Submit Booking
            </button>
        </form>
    </div>
</div>
</body>
</html>
