<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.event_booking_project_90.IT24100093.Models.Payment" %>
<%
    Payment payment = (Payment) session.getAttribute("lastPayment");
    String name = payment != null ? payment.getName() : "Not provided";
    String maskedCard = payment != null ? payment.getMaskedCardNumber() : "**** **** **** ****";
    String amount = payment != null ? payment.getAmount() : "Not provided";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoice</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: black;
            margin: 0;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .success-message {
            color: #28a745;
            font-weight: bold;
            font-size: 1.2em;
            margin: 20px 0;
        }
        .payment-details {
            text-align: left;
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        .payment-details p {
            margin: 10px 0;
            color: #555;
        }
        .payment-details strong {
            color: #333;
        }
        a {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #f97316;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
            font-weight: bold;
        }
        a:hover {
            background-color: #ea580c;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Invoice</h1>
    <div class="success-message">Payment Successful ✔</div>

    <div class="payment-details">
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Card:</strong> <%= maskedCard %></p>
        <p><strong>Amount:</strong> <%= amount %></p>
    </div>

    <a href="view.jsp">View</a>
</div>
</body>
</html>