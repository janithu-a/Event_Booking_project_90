<%@ page import="com.example.event_booking_project_90.model.Photography" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Photography Event</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }
    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background-color: white;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    h1 {
      color: #333;
      text-align: center;
    }
    form {
      margin-top: 20px;
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
    .btn-container {
      text-align: center;
      margin-top: 20px;
    }
    .btn {
      padding: 10px 15px;
      margin: 0 5px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
    .btn-primary {
      background-color: #4CAF50;
      color: white;
    }
    .btn-secondary {
      background-color: #f44336;
      color: white;
    }
  </style>
</head>
<body>
<%
  Photography event = (Photography)request.getAttribute("event");
  if (event == null) {
    response.sendRedirect("index.jsp");
    return;
  }
%>
<div class="container">
  <h1>Edit Photography Event</h1>
  <form action="EditEventServlet" method="post">
    <input type="hidden" name="eventId" value="<%= event.getId() %>">

    <div class="form-group">
      <label for="title">Event Title:</label>
      <input type="text" id="title" name="title" value="<%= event.getTitle() %>" required>
    </div>

    <div class="form-group">
      <label for="date">Date:</label>
      <input type="date" id="date" name="date" value="<%= event.getDate() %>" required>
    </div>

    <div class="form-group">
      <label for="location">Location:</label>
      <input type="text" id="location" name="location" value="<%= event.getLocation() %>" required>
    </div>

    <div class="form-group">
      <label for="description">Description:</label>
      <textarea id="description" name="description"><%= event.getDescription() %></textarea>
    </div>

    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" value="<%= event.getUsername() %>" required>
    </div>

    <div class="btn-container">
      <button type="submit" class="btn btn-primary">Update Event</button>
      <a href="index.jsp" class="btn btn-secondary">Cancel</a>
    </div>
  </form>
</div>
</body>
</html>


