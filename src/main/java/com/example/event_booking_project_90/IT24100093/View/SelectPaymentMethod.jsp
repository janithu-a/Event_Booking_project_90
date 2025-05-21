<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Payment Method</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #000; /* Black background */
        }
        .container {
            background-color:white; /* Dark container for contrast */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
            text-align: center;
            color: black;
            width: 90%;
            max-width: 400px;
        }
        h2 {
            margin-bottom: 20px;
        }
        .payment-option {
            margin: 15px 0;
            text-align: left;
        }
        label {
            margin-left: 8px;
        }
        button {
            padding: 10px 20px;
            background-color: #f97316; /* Orange color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #ea580c; /* Darker orange */
        }
    </style>
    <script>
        function handleFormSubmit(event) {
            event.preventDefault();
            const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked');
            if (!selectedMethod) {
                alert("Please select a payment method.");
                return;
            }

            if (selectedMethod.value === "card") {
                window.location.href = "index.jsp";
            } else if (selectedMethod.value === "cod") {
                window.location.href = "COD_Confirmation.jsp"; // Ensure this file exists
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Select Payment Method</h2>
    <form onsubmit="handleFormSubmit(event)">
        <div class="payment-option">
            <input type="radio" id="card" name="paymentMethod" value="card" required>
            <label for="card">Credit/Debit Card</label>
        </div>
        <div class="payment-option">
            <input type="radio" id="cod" name="paymentMethod" value="cod">
            <label for="cod">Cash on Delivery</label>
        </div>
        <button type="submit">Proceed</button>
    </form>
</div>
</body>
</html>
