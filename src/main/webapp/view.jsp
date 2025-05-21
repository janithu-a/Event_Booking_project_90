<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background: black;
        }
        .option-button {
            transition: all 0.3s ease;
        }
        .option-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
<div class="bg-white rounded-lg shadow-xl w-full max-w-md p-8 space-y-6">
    <h1 class="text-3xl font-bold text-center text-gray-800">View</h1>

    <div class="space-y-4">
        <a href="${pageContext.request.contextPath}/invoiceDetails"
           class="block w-full bg-orange-500 hover:bg-orange-600 text-white py-3 px-6 rounded-lg option-button text-center font-semibold">
            View Payment Details
        </a>

        <a href="${pageContext.request.contextPath}/viewPayments"
           class="block w-full bg-orange-500 hover:bg-orange-600 text-white py-3 px-6 rounded-lg option-button text-center font-semibold">
            View All Payments
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp"
           class="block w-full bg-orange-500 hover:bg-orange-600 text-white py-3 px-6 rounded-lg option-button text-center font-semibold">
            Go to Payment Form
        </a>
    </div>
</div>
</body>
</html>