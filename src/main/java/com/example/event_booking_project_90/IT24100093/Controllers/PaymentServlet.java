package com.example.event_booking_project_90.IT24100093.Controllers;

import com.example.event_booking_project_90.IT24100093.Models.Payment;
import com.example.event_booking_project_90.IT24100093.Models.PaymentRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentMethod = request.getParameter("paymentMethod");
        if ("card".equals(paymentMethod)) {
            response.sendRedirect("index.jsp");
            return;
        } else if ("cod".equals(paymentMethod)) {
            response.sendRedirect("COD_Confirmation.jsp");
            return;
        }

        // Handle card payment
        String name = request.getParameter("name");
        String card = request.getParameter("cardNumber");
        String amount = request.getParameter("amount");

        Payment payment = new Payment(name, card, amount);
        PaymentRepository repository = new PaymentRepository();
        repository.savePayment(payment);

        HttpSession session = request.getSession();
        session.setAttribute("lastPayment", payment);

        request.getRequestDispatcher("/invoice.jsp").forward(request, response);
    }
}