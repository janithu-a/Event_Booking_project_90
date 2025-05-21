package com.example.event_booking_project_90.IT24100093.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/selectPaymentMethod")
public class SelectPaymentMethodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");

        HttpSession session = request.getSession();
        session.setAttribute("selectedPaymentMethod", paymentMethod);

        if ("card".equals(paymentMethod)) {
            response.sendRedirect("index.jsp");
        } else if ("cod".equals(paymentMethod)) {
            response.sendRedirect("COD_Confirmation.jsp");
        } else {
            response.sendRedirect("SelectPaymentMethod.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("SelectPaymentMethod.jsp");
    }
}