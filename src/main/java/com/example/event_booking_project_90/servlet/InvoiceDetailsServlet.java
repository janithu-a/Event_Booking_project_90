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

@WebServlet("/invoiceDetails")
public class InvoiceDetailsServlet extends HttpServlet {

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
        out.println("<head>");
        out.println("<title>Detailed Payment</title>");
        out.println("<style>");
        out.println("body {");
        out.println("    font-family: Arial, sans-serif;");
        out.println("    background: black;");
        out.println("    display: flex;");
        out.println("    justify-content: center;");
        out.println("    align-items: center;");
        out.println("    height: 100vh;");
        out.println("    margin: 0;");
        out.println("}");
        out.println(".container {");
        out.println("    background: white;");
        out.println("    padding: 30px;");
        out.println("    border-radius: 10px;");
        out.println("    box-shadow: 0 0 15px rgba(0,0,0,0.2);");
        out.println("    max-width: 500px;");
        out.println("    width: 90%;");
        out.println("}");
        out.println("h1 {");
        out.println("    color: #333;");
        out.println("    margin-bottom: 20px;");
        out.println("    text-align: center;");
        out.println("}");
        out.println(".detail {");
        out.println("    margin: 15px 0;");
        out.println("    color: #555;");
        out.println("}");
        out.println(".detail strong {");
        out.println("    color: #333;");
        out.println("}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>Detailed Payment</h1>");
        out.println("<div class='detail'><strong>Name:</strong> " + payment.getName() + "</div>");
        out.println("<div class='detail'><strong>Card:</strong> " + payment.getMaskedCardNumber() + "</div>");
        out.println("<div class='detail'><strong>Amount:</strong> " + (payment.getAmount() != null ? payment.getAmount() : "Not provided") + "</div>");
        out.println("<div class='detail'><strong>Date & Time:</strong> " + payment.getTimestamp() + "</div>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}