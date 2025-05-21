<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function updateAmounts() {
            const amountInput = document.getElementById("amount");
            const subAmountSpan = document.getElementById("subAmount");
            const totalAmountSpan = document.getElementById("totalAmount");

            let value = parseFloat(amountInput?.value) || 0;
            //let fee = value * 0.0025;//
            let total = value ;//

            subAmountSpan.textContent = `Rs. ${value.toFixed(2)}`;
            totalAmountSpan.textContent = `Rs. ${total.toFixed(2)}`;
        }

        function validateForm(event) {
            const cardNumber = document.getElementById("cardNumber").value;
            const cvv = document.getElementById("cvv").value;
            const name = document.getElementById("name").value;

            const cardRegex = /^\d{16}$/;
            const cvvRegex = /^\d{3}$/;
            const nameRegex = /^[a-zA-Z\s]+$/;

            if (!cardRegex.test(cardNumber)) {
                alert("Card Number must be exactly 16 digits.");
                event.preventDefault();
                return false;
            }

            if (!cvvRegex.test(cvv)) {
                alert("CVV must be exactly 3 digits.");
                event.preventDefault();
                return false;
            }

            if (!nameRegex.test(name)) {
                alert("Name must contain only letters and spaces.");
                event.preventDefault();
                return false;
            }

            return true;
        }

        function toggleModal() {
            document.getElementById("cardModal").classList.toggle("hidden");
        }

        function addCard() {
            const fullCardNumber = prompt("Enter full 16-digit card number:");
            const name = prompt("Enter name on card:");
            const expiryMonth = prompt("Enter expiry month (MM):");
            const expiryYear = prompt("Enter expiry year (YY):");

            if (fullCardNumber && name && expiryMonth && expiryYear) {
                const cardList = document.getElementById("savedCards");
                const li = document.createElement("li");
                li.className = "flex justify-between items-center bg-gray-100 px-3 py-2 rounded mt-2 cursor-pointer";
                li.setAttribute("data-card", JSON.stringify({
                    cardNumber: fullCardNumber,
                    name,
                    expiryMonth,
                    expiryYear,
                }));

                li.innerHTML = `
                    <span class="flex-1" onclick="fillCardDetails(this.parentElement)">${formatCardNumber(fullCardNumber)}</span>
                    <div class="flex items-center space-x-2">
                        <button onclick="updateCard(this.parentElement.parentElement)" class="text-blue-600 hover:underline text-sm">Update</button>
                        <button onclick="this.parentElement.parentElement.remove(); event.stopPropagation();" class="text-red-600 hover:underline text-sm">Delete</button>
                    </div>
                `;
                cardList.appendChild(li);
            }
        }

        function formatCardNumber(cardNumber) {
            return cardNumber.replace(/(\d{4})(?=\d)/g, "$1 ");
        }

        function fillCardDetails(li) {
            const data = JSON.parse(li.getAttribute("data-card"));
            document.getElementById("cardNumber").value = data.cardNumber;
            document.getElementById("name").value = data.name;
            document.querySelector('select[name="expiryMonth"]').value = data.expiryMonth;
            document.querySelector('select[name="expiryYear"]').value = data.expiryYear;
            toggleModal();
        }

        function updateCard(li) {
            const data = JSON.parse(li.getAttribute("data-card"));

            const fullCardNumber = prompt("Update full card number:", data.cardNumber);
            const name = prompt("Update name on card:", data.name);
            const expiryMonth = prompt("Update expiry month (MM):", data.expiryMonth);
            const expiryYear = prompt("Update expiry year (YY):", data.expiryYear);

            if (fullCardNumber && name && expiryMonth && expiryYear) {
                li.setAttribute("data-card", JSON.stringify({
                    cardNumber: fullCardNumber,
                    name,
                    expiryMonth,
                    expiryYear,
                }));
                li.innerHTML = `
                    <span class="flex-1" onclick="fillCardDetails(this.parentElement)">${formatCardNumber(fullCardNumber)}</span>
                    <div class="flex items-center space-x-2">
                        <button onclick="updateCard(this.parentElement.parentElement)" class="text-blue-600 hover:underline text-sm">Update</button>
                        <button onclick="this.parentElement.parentElement.remove(); event.stopPropagation();" class="text-red-600 hover:underline text-sm">Delete</button>
                    </div>
                `;
            }
        }
    </script>
</head>
<body class="bg-black min-h-screen flex items-center justify-center p-4 text-white">

<div class="bg-gray-800 rounded-xl shadow-md w-full max-w-md p-6 space-y-4 relative">
    <button onclick="toggleModal()" class="absolute top-3 left-3 bg-red-500 hover:bg-red-600 text-white text-sm px-3 py-1 rounded">
        Manage Cards
    </button>

    <h2 class="text-xl font-semibold text-white text-center">Credit/Debit Card</h2>

    <div class="flex justify-end items-center space-x-2">
        <img src="https://img.icons8.com/color/48/000000/visa.png" alt="Visa" class="w-8 h-8"/>
        <img src="https://img.icons8.com/color/48/000000/mastercard.png" alt="MasterCard" class="w-8 h-8"/>
        <img src="https://img.icons8.com/color/48/000000/amex.png" alt="Amex" class="w-8 h-8"/>
    </div>

    <form id="paymentForm" action="payment" method="post" class="space-y-4" onsubmit="return validateForm(event)">
        <input type="text" id="cardNumber" name="cardNumber" placeholder="Card Number" maxlength="16" pattern="\d{16}" class="w-full border rounded p-3 text-black" required>

        <div class="flex space-x-2">
            <select name="expiryMonth" class="w-1/2 border rounded p-3 text-black" required>
                <option value="" disabled selected hidden>Select Expiry MM</option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
            <select name="expiryYear" class="w-1/2 border rounded p-3 text-black" required>
                <option value="" disabled selected hidden>Select Expiry YY</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
                <option value="32">32</option>
                <option value="33">33</option>
                <option value="34">34</option>
            </select>
        </div>

        <input type="text" id="cvv" name="cvv" placeholder="CVV" maxlength="3" pattern="\d{3}" class="w-full border rounded p-3 text-black" required>

        <input type="text" id="name" name="name" placeholder="Name on Card" pattern="[A-Za-z\s]+" class="w-full border rounded p-3 text-black" required>

        <input type="number" id="amount" name="amount" placeholder="Enter amount" class="w-full border rounded p-3 text-black" oninput="updateAmounts()" required>

        <div class="pt-4 border-t text-gray-400">
            <div class="flex justify-between text-sm">
                <span>Subtotal</span>
                <span id="subAmount">Rs. 0.00</span>
            </div>
            <div class="flex justify-between font-semibold text-lg text-white mt-1">
                <span>Total Amount</span>
                <span id="totalAmount">Rs. 0.00</span>
            </div>
        </div>

        <div class="space-y-2 pt-4">
            <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white w-full py-3 rounded-lg text-lg font-semibold">
                Pay Now
            </button>
            <button type="button" onclick="document.getElementById('paymentForm').reset(); updateAmounts();" class="bg-orange-500 hover:bg-orange-600 text-white w-full py-3 rounded-lg text-lg font-semibold">
                Clear Form
            </button>
        </div>
    </form>
</div>

<div id="cardModal" class="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-xl shadow-lg p-6 w-full max-w-sm">
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-lg font-semibold">Manage Cards</h3>
            <button onclick="toggleModal()" class="text-gray-500 hover:text-gray-800 text-2xl font-bold">×</button>
        </div>
        <ul id="savedCards" class="text-sm text-gray-700">
            <%-- Dynamic card entries will be added here via JavaScript --%>
        </ul>
        <button onclick="addCard()" class="mt-4 w-full bg-orange-500 hover:bg-orange-600 text-white py-2 rounded-lg text-sm">
            Add Card
        </button>
    </div>
</div>

</body>
</html>