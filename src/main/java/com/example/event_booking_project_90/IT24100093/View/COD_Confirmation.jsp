<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cash on Delivery Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: black;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .confirmation-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            margin: 15px 0;
            color: #555;
        }
        .divider {
            border-top: 1px solid #ddd;
            margin: 20px 0;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #f97316;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
        }
        a:hover {
            background-color: #ea580c;
        }
    </style>
</head>
<body>
<div class="confirmation-box">
    <h2>Cash on Delivery Selected</h2>
    <p>Thank you! Your order has been placed successfully.</p>
    <p>Total amount to be paid at delivery.</p>
    <div class="divider"></div>
    <a href="SelectPaymentMethod.jsp">Back to Payment Options</a>
</div>
</body>
</html>