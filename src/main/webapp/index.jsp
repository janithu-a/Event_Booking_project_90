<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Photography Event Manager</title>
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
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .add-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 16px;
        }
        .section-title {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .events-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .event-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .event-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .event-card h3 {
            margin-top: 0;
            color: #333;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .event-card p {
            margin: 8px 0;
        }
        .view-details {
            text-align: center;
            margin-top: 15px;
            display: block;
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
        }
        .event-actions {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }
        .edit-btn, .delete-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }
        .edit-btn {
            background-color: #2196F3;
            color: white;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        #eventModal {
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
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover {
            color: #555;
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
        .form-group textarea {
            height: 100px;
            resize: vertical;
        }
    </style>
    <script>
        function openModal() {
            document.getElementById('eventModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('eventModal').style.display = 'none';
        }

        // Close modal when clicking outside of it
        window.onclick = function(event) {
            var modal = document.getElementById('eventModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>
</head>
<body>
<header>
    <h1>Photography Event Manager</h1>
    <button class="add-button" onclick="openModal()">+ Add Event</button>
</header>

<div class="container">
    <h2 class="section-title">Photography Events</h2>

    <div class="events-container">
        <%
            List<Photography> events = PhotoEventFileHandler.getAllEvents();
            if (events != null && !events.isEmpty()) {
                for (Photography event : events) {
        %>
        <div class="event-card">
            <h3><%= event.getTitle() %></h3>
            <p><strong>Date:</strong> <%= event.getDate() %></p>
            <p><strong>Location:</strong> <%= event.getLocation() %></p>
            <p><strong>Description:</strong> <%=
            event.getDescription().length() > 100 ?
                    event.getDescription().substring(0, 100) + "..." :
                    event.getDescription()
            %></p>
            <a href="eventDetails.jsp?eventId=<%= event.getId() %>" class="view-details">
                View Details
            </a>
            <div class="event-actions">
                <form action="EditEventServlet" method="get" style="display:inline;">
                    <input type="hidden" name="eventId" value="<%= event.getId() %>"/>
                    <button type="submit" class="edit-btn">Edit</button>
                </form>
                <form action="DeleteEventServlet" method="post" style="display:inline;">
                    <input type="hidden" name="eventId" value="<%= event.getId() %>"/>
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div style="grid-column: 1 / -1; text-align: center; padding: 40px 0;">
            <h3>No events found</h3>
            <p>Click the '+ Add Event' button to create your first photography event.</p>
        </div>
        <% } %>
    </div>
</div>

<!-- Modal for adding events -->
<div id="eventModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Create New Event</h2>
            <span class="close" onclick="closeModal()">&times;</span>
        </div>
        <form action="AddEventServlet" method="post">
            <div class="form-group">
                <label for="title">Event Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="location">Location:</label>
                <input type="text" id="location" name="location" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group" style="text-align: right;">
                <button type="button" onclick="closeModal()" style="background-color: #ccc; margin-right: 10px;">Cancel</button>
                <button type="submit" style="background-color: #4CAF50; color: white;">Save Event</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
