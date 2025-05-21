package com.example.event_booking_project_90.servlet;

import com.example.event_booking_project_90.model.Payment;
import com.example.event_booking_project_90.util.PaymentRepository;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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