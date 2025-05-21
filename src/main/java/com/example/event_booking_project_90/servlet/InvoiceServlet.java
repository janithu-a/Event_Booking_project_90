package com.example.event_booking_project_90.servlet;

import com.example.event_booking_project_90.model.Payment;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        Payment payment = (Payment) session.getAttribute("lastPayment");
        if (payment == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>Invoice</title></head>");
        out.println("<body>");
        out.println("<h1>Invoice</h1>");
        out.println("<p>Name: " + payment.getName() + "</p>");
        out.println("<p>Card: " + payment.getMaskedCardNumber() + "</p>");
        out.println("<p>Amount: " + payment.getAmount() + "</p>");
        out.println("<a href='viewPayments'>View All Payments</a>");
        out.println("</body>");
        out.println("</html>");
    }
}